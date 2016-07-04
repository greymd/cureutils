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

  # Convert string to precure regular expression
  def pregex2regex(regex, br_flg = false)
    this_regex = regex.dup
    br_ex = br_flg ? '' : '?:'
    %w(girl_name human_name precure_name cast_name color).each do |attr|
      expression = '\[:' + attr + ':\]'
      precures_ex = cure_list(attr.to_sym).join('|')
      replaced = "(#{br_ex}#{precures_ex})"
      this_regex.gsub!(/#{expression}/, replaced)
    end
    this_regex
  end

  def cure_list(sym)
    list = Precure.all_stars.map(&sym)
    list << Cure.echo[sym]
    # Regulate cure princes human name
    list.map do |str|
      str.gsub!(/\(.+?\)/, '')
      str
    end
    list
  end

  def cure_table(to_sym, from_sym)
    to_arr = cure_list(to_sym)
    from_arr = cure_list(from_sym)
    hash = Hash[[to_arr, from_arr].transpose]
    hash
  end

  def print_results
    # Create precure regular expression
    regex_tag = str2pregex(@translate_from.to_s)
    # Get patterns
    cure_pattern = pregex2regex(regex_tag, true)
    # Get Key-Value
    table = cure_table(@translate_from, @translate_to)
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
