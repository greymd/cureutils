# coding: utf-8
require 'cureutils/version'
require 'cureutils/janken_controller'
require 'cureutils/cure_date_checker'
require 'cureutils/cure_grep_manager'
require 'active_support'
require 'active_support/time'
require 'time'
require 'thor'
require 'rubicure'
require 'colorize'

module Cureutils
  module EchoMode
    TRANSFORM = 1
    ATTACK = 2
  end
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
      CureGrepManager.source_input(filename)
      CureGrepManager.source_output($stdout)
      # Check the file discriptor to check the pipe exists or not.
      CureGrepManager.option_colorize($stdout.isatty)
      CureGrepManager.option_only(options['only-matching'.to_sym])
      # Print matched lines.
      exit_status = CureGrepManager.print_results(/#{pat}/)
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
      cure_name = options[:precure] || 'echo'
      message_mode = EchoMode::TRANSFORM
      message_mode = EchoMode::TRANSFORM if options[:transform]
      message_mode = EchoMode::ATTACK if options[:attack]
      Rubicure::Girl.sleep_sec = 0 if options[:quick]
      cure = Rubicure::Girl.config.find { |k, _v| k == cure_name.to_sym }
      unless cure
        $stderr.puts "No such precure #{cure_name}"
        exit(1)
      end
      if message_mode == EchoMode::TRANSFORM
        Cure.send(cure_name.to_sym).transform!
      elsif message_mode == EchoMode::ATTACK
        Cure.send(cure_name.to_sym).transform!
        Cure.send(cure_name.to_sym).attack!
      end
    end

    desc 'date [OPTIONS] [+FORMAT]',
         'Display date, time and Precure related events.'
    option 'date', aliases: 'd'
    # Original date command's default is '+%a %b %e %H:%M:%S %Z %Y @P'
    # However, I would like to adopt this setting.
    def date(fmt = '+%F %H:%M:%S @P')
      # -d, --date=STRING (YYYY-MM-DD or +-N days)
      print_time = create_time_obj(options[:date])
      updated_fmt = update_fmt(print_time, fmt)
      puts print_time.strftime(updated_fmt)
    end

    desc 'janken', %q(Let's play "Pikarin Janken" !)
    def janken
      exit(JankenContoller.janken.to_i)
    end

    private

    def update_fmt(datetime, fmt)
      # Find precure related events
      date4check_event = time2date(datetime)
      found_event = CureDateChecker.events(date4check_event)
      checked_fmt = fmt
      if fmt =~ /^\+(.*)$/
        checked_fmt = Regexp.last_match(1)
      else
        puts "cure date: invalid date format '#{fmt}'"
        exit 1
      end
      # Find precure related events
      checked_fmt.gsub(/@P/, found_event)
    end

    def create_time_obj(time_str)
      time_str ? natural_lang2time(time_str) : Time.now
    end

    def natural_lang2time(time_str)
      updated_fmt = time_str.dup
      updated_fmt.gsub!(/yesterday/, '1 day ago')
      updated_fmt.gsub!(/tomorrow/, '-1 day ago')
      units = 'second|minute|hour|day|week|month|year'
      regulated_format = /(-?[0-9]+) *(#{units})s? *(ago)?/
      if updated_fmt =~ regulated_format
        diff_value = Regexp.last_match(1).to_i
        unit = Regexp.last_match(2).to_sym
        minus_flg = Regexp.last_match(3)
        if minus_flg.nil?
          Time.now + diff_value.send(unit)
        else
          Time.now - diff_value.send(unit)
        end
      else
        Time.parse(updated_fmt)
      end
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

    def time2date(time_obj)
      Date.parse(time_obj.strftime('%Y-%m-%d'))
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
