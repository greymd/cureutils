# frozen_string_literal: true

require 'cureutils/logic/base_logic'
require 'colorize'

# Singleton class for cure grep
# Managing the method for matching and printing.
class GrepLogic < BaseLogic
  module ColorMode
    NONE = :to_s
    RED = :red
  end

  def initialize
    super
    @match_method = 'match'
  end

  def option_only(only_flag)
    @only_matched = only_flag
    @match_method = (only_flag ? 'scan' : 'match')
  end

  def option_colorize(colorize)
    @str_color = (colorize ? ColorMode::RED : ColorMode::NONE)
  end

  def pattern(pat, is_exregex = false)
    if is_exregex
      @pattern = /#{pat}/
      return
    end
    @pattern = /#{Common.pregex2regex(pat)}/
  end

  def print_results
    exit_status = 1
    @in.each do |line|
      matched_strs = line.send(@match_method, @pattern)
      next unless matched_strs

      exit_status = 0
      if @only_matched
        matched_strs.each { |str| @out.puts str.send(@str_color) }
      else
        @out.puts line.gsub(@pattern, '\0'.send(@str_color))
      end
    end
    exit_status
  end
end
