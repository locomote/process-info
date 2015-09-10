module ProcessInfo
  class Info
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
      keys.zip(load_process_info).to_h
    end

    private

    def load_process_info
      `ps -o '#{ps_keys.join(",")}' -p #{pid} | tail -n 1`.split(/\s+/)
    end
  end
end
