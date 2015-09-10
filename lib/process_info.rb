require "process_info/version"
require "process_info/info"

module ProcessInfo
  KEYWORD_MAP = {
    pid:        "pid",
    mem_usage:  "%mem",
    cpu_usage:  "%cpu",
    started:    "start",
    uptime:     "etime"
  }.freeze

  def self.info(pid, *keywords, **keymap)
    Info.new(pid, *keywords, **keymap).to_h
  end
end
