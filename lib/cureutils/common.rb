# coding: utf-8
#
# Class includes common methos which are refered from multiple commands.
#
class Common
  class << self
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
      list = Precure.all_girls.map(&sym)
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
  end
end
