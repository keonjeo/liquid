require 'benchmark/ips'
require 'memory_profiler'
require_relative 'theme_runner'

Liquid::Template.error_mode = ARGV.first.to_sym if ARGV.first
profiler = ThemeRunner.new

report = MemoryProfiler.report do
  profiler.compile
end

puts
puts "Parsing:"
puts
report.pretty_print

report = MemoryProfiler.report do
  profiler.render
end

puts
puts "Rendering:"
puts
report.pretty_print
