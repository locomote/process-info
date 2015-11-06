require 'posix/spawn'

module ProcessInfo
  class Info
    include POSIX::Spawn

    attr_reader :pid, :keys, :keymap

    def initialize(pid, *keys, **keymap)
      @pid = pid
      @keymap = KEYWORD_MAP.merge(keymap)
      @keys = (keys.map(&:to_sym) + keymap.keys).uniq & @keymap.keys
      @keys = @keymap.keys if @keys.empty?
    end

    def ps_keys
      @ps_keys ||= keymap.values_at(*keys)
    end

    def to_h
      Hash[keys.zip(load_process_info)]
    end

    private

    def load_process_info
      pid, in_f, out_f, err_f = popen4(cmd)
      in_f.close
      out_f.read.split("\n").last.split(/\s+/)
    ensure
      [in_f, out_f, err_f].each { |io| io.close if !io.closed? }
      Process::waitpid(pid)
    end

    def cmd
      # "ps -o '#{ps_keys.join(",")}' -p #{pid} | tail -n 1".split(/\s+/)"
      "ps -o '#{ps_keys.join(",")}' -p #{pid}"
    end
  end
end
