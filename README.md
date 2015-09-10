# ProcessInfo

A very simple module for getting system process information.

## Installation

Add this line to your application's Gemfile:

    gem 'process-info'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install process-info

## Basic Usage

To fetch the CPU and memory usage of a process:

```ruby
ProcessInfo.info(1234, :cpu_usage, :mem_usage)
# => { cpu_usage: "0.1", mem_usage: "0.4" }
```

## Available information

Key         | Description
----------- | ----------------------------
pid         | Process ID
mem_usage   | Memory usage as a percentage
cpu_usage   | CPU usage as a percentage
started     | Process start time
uptime      | Process uptime

## Advanced usage

`ProcessInfo` uses the `ps` command-line utility and can return any
information available to it's `-o` option if you supply a keyword map:

```ruby
ProcessInfo.info(1234, cpu: "%cpu", virtual_size: "vsize")
# => { cpu: "0.1", virtual_size: "4522932" }

```

You can also mix-and-match your custom keyword map with the default map:

```ruby
ProcessInfo.info(1234, :cpu_usage, cpu_time: "cputime")
# => { cpu_usage: "0.1", cpu_time: "2:09.65" }
```
