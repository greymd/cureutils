# frozen_string_literal: true
module Cureutils
  class Version
    MAJOR = 1
    MINOR = 0
    PATCH = 1
    PRE = nil

    class << self
      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end
    end
  end
end
