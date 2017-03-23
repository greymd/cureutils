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
  end

  def source_err(source = $stderr)
    @err = source
  end
end
