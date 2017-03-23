# coding: utf-8
require 'cureutils/version'
require 'cureutils/common'
require 'cureutils/cure_janken_manager'
require 'cureutils/cure_date_manager'
require 'cureutils/cure_grep_manager'
require 'cureutils/cure_echo_manager'
require 'cureutils/cure_translate_manager'
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

    desc 'version', 'Output the version number.'
    def version
      puts "#{Cureutils.name} #{Cureutils::Version}"
    end

    desc 'transform', 'Change human_name to precure_name.'
    def transform
      manager = CureTranslateManager.new
      manager.translate_from_to('[:human_name:]', '[:precure_name:]')
      manager.in = $stdin
      exit(manager.print_results)
    end

    desc 'humanize', 'Change precure_name to human_name.'
    def humanize
      manager = CureTranslateManager.new
      manager.translate_from_to('[:precure_name:]', '[:human_name:]')
      manager.in = $stdin
      exit(manager.print_results)
    end

    desc 'girls [OPTIONS]', "Print girls' name."
    option 'verbose',   aliases: 'v',
                        type: :boolean,
                        desc: "Include particular girl's full name."
    option 'movie',     aliases: 'm',
                        type: :boolean,
                        desc: 'Include who have only appeared in the movies.'
    def girls
      girls = Precure.all_girls
      girls.delete(Cure.echo) unless options[:movie]
      if options['full-name'.to_sym]
        girls.each do |v|
          puts v.full_name
        end
      else
        girls.each do |v|
          puts v.human_name
        end
      end
    end

    desc 'precures [OPTIONS]', 'Print Precure names.'
    option 'movie',     aliases: 'm',
                        type: :boolean,
                        desc: 'Include who have only appeared in the movies.'
    def precures
      cures = Precure.all_girls
      cures.delete(Cure.echo) unless options[:movie]
      cures.map!(&:precure_name)
      cures.each do |v|
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
      manager = CureGrepManager.new
      manager.source_input(filename)
      manager.pattern(default_pat.clone, options['extended-regexp'.to_sym])
      # Check the file discriptor to check the pipe exists or not.
      manager.option_colorize($stdout.isatty)
      manager.option_only(options['only-matching'.to_sym])
      # Print matched lines.
      exit(manager.print_results)
    end

    desc 'tr PATTERN REPLACE', 'Translate Precure related parameters.'
    def tr(pat_from = '[:precure_name:]', pat_to = '[:human_name:]')
      manager = CureTranslateManager.new
      manager.in = $stdin
      manager.translate_from_to(pat_from, pat_to)
      exit(manager.print_results)
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
    option 'style',     aliases: 's',
                        type: :string,
                        desc: 'Choose style of the transformation.'
    def echo
      manager = CureEchoManager.new
      manager.precure(options[:precure])
      manager.msg_attack(options[:attack])
      manager.nosleep(options[:quick])
      manager.style(options[:style])
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
  end
end
