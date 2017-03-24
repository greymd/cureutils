# frozen_string_literal: true
# coding: utf-8

#
# Base class of logic class
#
class BaseLogic
  def initialize
    @in  = $stdin
    @out = $stdout
    @err = $stderr
  end

  def source_output(source = $stdout)
    @out = source
  end

  def source_input(source = $stdin)
    @in = source
    if source.nil? || source =~ /^-$/
      # If the file name is "-", use STDIN.
      @in = $stdin
    else
      file(source)
    end
  end

  def source_err(source = $stderr)
    @err = source
  end

  private

  def file(filename)
    @in = File.open(filename)
  rescue SystemCallError => e
    @err.puts e.message.to_s
    # TODO: Define error codes as enum.
    exit(2)
  rescue IOError => e
    @err.puts e.message.to_s
    exit(2)
  end
end
