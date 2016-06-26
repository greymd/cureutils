# coding: utf-8
require 'colorize'

# Singleton class for cure grep
# Managing the method for matching and printing.
class CureGrepManager
  module ColorMode
    NONE = :to_s
    RED = :red
  end

  class << self
    def option_only(only_flag)
      @only_matched = only_flag
      @match_method = (only_flag ? 'scan' : 'match')
    end

    def option_colorize(colorize)
      @str_color = (colorize ? ColorMode::RED : ColorMode::NONE)
    end

    def source_output(source = $stdout)
      @output = source
    end

    def source_input(source = nil)
      if source.nil? || source.empty?
        @input = $stdin
      elsif source =~ /^-$/
        # If the file name is "-", use STDIN.
        @input = $stdin
      else
        file(source)
      end
    end

    def print_results(pattern)
      @input.each do |line|
        matched_strs = line.send(@match_method, pattern)
        next unless matched_strs
        if @only_matched
          matched_strs.each { |str| @output.puts str.send(@str_color) }
        else
          @output.puts line.gsub(pattern, '\0'.send(@str_color))
        end
      end
    end

    private

    def file(filename)
      @input = File.open(filename)
    rescue SystemCallError => e
      puts %(class=[#{e.class}] message=[#{e.message}])
    rescue IOError => e
      puts %(class=[#{e.class}] message=[#{e.message}])
    end
  end
end
