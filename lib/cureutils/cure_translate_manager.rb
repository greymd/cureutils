# coding: utf-8
#
# Class for managing cure tr (translate).
#
class CureTranslateManager
  def initialize
    @translate_from = :human_name
    @translate_to = :precure_name
    @out = $stdout
    @in = $stdin
  end

  attr_writer :out, :in

  def translate_from_to(from, to)
    @translate_from = pregex2str(from).to_sym
    @translate_to = pregex2str(to).to_sym
  end

  def str2pregex(str)
    '[:' + str + ':]'
  end

  def pregex2str(str)
    str.gsub(/\[:(.*):\]/, '\1')
  end

  def print_results
    # Create precure regular expression
    regex_tag = str2pregex(@translate_from.to_s)
    # Get patterns
    cure_pattern = Common.pregex2regex(regex_tag, true)
    # Get Key-Value
    table = Common.cure_table(@translate_from, @translate_to)
    @in.each do |line|
      updated_line = line.dup
      line.scan(/#{cure_pattern}/).each do |pat|
        updated_line.gsub!(/#{pat[0]}/, table[pat[0]])
      end
      puts updated_line
    end
    0
  end
end
