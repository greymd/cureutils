# coding: utf-8
require 'cureutils/version'
require 'cureutils/cure_janken_manager'
require 'cureutils/cure_date_manager'
require 'cureutils/cure_grep_manager'
require 'cureutils/cure_echo_manager'
require 'active_support'
require 'active_support/time'
require 'time'
require 'thor'
require 'rubicure'
require 'colorize'

module Cureutils
  #
  # The class represents the cli interface
  #
  class CLI < Thor
    class << self
      def exit_on_failure?
        true
      end
    end

    desc 'transform', 'Change human_name to precure_name'
    def transform
      print_converted_text($stdin, :human_name, :precure_name)
    end

    desc 'humanize', 'Change precure_name to human_name.'
    def humanize
      print_converted_text($stdin, :precure_name, :human_name)
    end

    desc 'girls', "Print girls' name"
    def girls
      Rubicure::Girl.config.map { |_k, v| v[:human_name] }.uniq.each do |v|
        puts v
      end
    end

    desc 'precures', 'Print Precure names'
    def precures
      Rubicure::Girl.config.map { |_k, v| v[:precure_name] }.uniq.each do |v|
        puts v
      end
    end

    desc 'grep [OPTIONS] PATTERN', 'Print lines matching a pattern.'
    option 'extended-regexp', aliases: 'E',
                              type: :boolean,
                              desc: 'Disable Precure Bracket Expression.'
    option 'only-matching', aliases: 'o',
                            type: :boolean,
                            desc: 'Print only the matched parts.'
    def grep(default_pat = '[:precure_name:]', filename = nil)
      pat = default_pat.clone
      pat = pregex2regex(default_pat) unless options['extended-regexp'.to_sym]
      manager = CureGrepManager.new
      manager.source_input(filename)
      # Check the file discriptor to check the pipe exists or not.
      manager.option_colorize($stdout.isatty)
      manager.option_only(options['only-matching'.to_sym])
      # Print matched lines.
      exit_status = manager.print_results(/#{pat}/)
      exit(exit_status)
    end

    desc 'tr PATTERN REPLACE', 'Translate Precure related parameters.'
    def tr(pat_from = '[:precure_name:]', pat_to = '[:human_name:]')
      pat_from = pregex2str(pat_from).to_sym
      pat_to = pregex2str(pat_to).to_sym
      print_converted_text($stdin, pat_from, pat_to)
    end

    desc 'echo [OPTIONS] PATTERN', 'Print messages of Precure.'
    option 'quick',     aliases: 'q',
                        type: :boolean,
                        desc: 'Print messages immediately.'
    option 'attack',    aliases: 'a',
                        type: :boolean,
                        desc: 'Print attack message.'
    option 'transform', aliases: 't',
                        type: :boolean,
                        desc: 'Print transform message.'
    option 'precure',   aliases: 'p',
                        type: :string,
                        desc: "Print the given PRECURE's message."
    def echo
      manager = CureEchoManager.new
      manager.precure(options[:precure])
      manager.msg_attack(options[:attack])
      manager.nosleep(options[:quick])
      exit(manager.print_results)
    end

    desc 'date [OPTIONS] [+FORMAT]',
         'Display date, time and Precure related events.'
    option 'date', aliases: 'd'
    # Original date command's default is '+%a %b %e %H:%M:%S %Z %Y @P'
    # However, I would like to adopt this setting.
    def date(fmt = '+%F %H:%M:%S @P')
      manager = CureDateManager.new
      manager.datetime(options[:date])
      manager.format = fmt
      exit(manager.print_results)
    end

    desc 'janken', %q(Let's play "Pikarin Janken" !)
    def janken
      manager = CureJankenManager.new
      exit(manager.janken.to_i)
    end

    private

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

    def str2pregex(str)
      '[:' + str + ':]'
    end

    def pregex2str(str)
      str.gsub(/\[:(.*):\]/, '\1')
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

    def print_converted_text(input, from_sym, to_sym)
      # Create precure regular expression
      regex_tag = str2pregex(from_sym.to_s)
      # Get patterns
      cure_pattern = pregex2regex(regex_tag, true)
      # Get Key-Value
      table = cure_table(from_sym, to_sym)
      input.each do |line|
        updated_line = line.dup
        line.scan(/#{cure_pattern}/).each do |pat|
          updated_line.gsub!(/#{pat[0]}/, table[pat[0]])
        end
        puts updated_line
      end
    end
  end
end
