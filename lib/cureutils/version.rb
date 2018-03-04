# frozen_string_literal: true
module Cureutils
  class Version
    MAJOR = 1
    MINOR = 1
    PATCH = 0
    PRE = nil

    class << self
      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end
    end
  end
end
