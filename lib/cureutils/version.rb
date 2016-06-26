module Cureutils
  class Version
    MAJOR = 0
    MINOR = 1
    PATCH = 4
    PRE = nil

    class << self
      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end
    end
  end
end
