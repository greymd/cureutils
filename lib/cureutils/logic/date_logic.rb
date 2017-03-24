# coding: utf-8
require 'cureutils/logic/base_logic'
require 'date'

#
# Date class supports the precure format
#
class DateLogic < BaseLogic
  def initialize
    super
    hashize_cure_date
    hashize_movie_date
    @in = []
    @in << nil
    @opt_date = false
    @opt_file = false
    @format = '+%F %H:%M:%S @P'
  end

  def opt_date(given_datetime)
    return if given_datetime.nil?
    @opt_date = true
    @in = []
    @in << given_datetime
  end

  def opt_file(filename)
    return if filename.nil?
    @opt_file = true
    source_input(filename)
  end

  attr_writer :format

  def print_results
    return 1 unless check_opts
    @in.each do |line|
      given_date = line ? natural_lang2time(line) : Time.now
      updated_fmt = update_fmt(given_date, @format) if given_date
      @out.puts given_date.strftime(updated_fmt) if updated_fmt
    end
    0
  end

  private

  def check_opts
    # Either option must be true, but both must NOT be same.
    return true unless @opt_date && @opt_file
    @err.puts <<-EOS
cure date: the options to specify dates for printing are mutually exclusive.
    EOS
    exit(1)
  end

  def validate_date_str(str)
    Date.parse(str)
  rescue ArgumentError => e
    @err.puts "cure date: #{e.message} '#{str.chomp}'"
    return false
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
      return Time.now + diff_value.send(unit) if minus_flg.nil?
      return Time.now - diff_value.send(unit)
    elsif validate_date_str(updated_fmt)
      # Format like "yyyy-mm-dd", "yyyy/mm/dd" and "yyyymmdd"
      return Time.parse(updated_fmt)
    end
    false
  end

  def update_fmt(datetime, fmt)
    # Find precure related events
    date4check_event = time2date(datetime)
    found_event = events(date4check_event)
    checked_fmt = fmt
    if fmt =~ /^\+(.*)$/
      checked_fmt = Regexp.last_match(1)
    else
      @err.puts "cure date: invalid date format '#{fmt}'"
      exit 1
    end
    # Find precure related events
    checked_fmt.gsub(/@P/, found_event)
  end

  def events(date)
    event_list = [birth_date?(date),
                  created_date?(date),
                  movie_date?(date),
                  series_between(date)].compact
    event_list.join('/')
  end

  def time2date(time_obj)
    Date.parse(time_obj.strftime('%Y-%m-%d'))
  end

  def birth_date?(date)
    date_str = date.strftime('%-m/%-d')
    result = @birth_date[date_str.to_sym]
    "#{result[:human_name]}(#{result[:precure_name]})誕生日" unless result.nil?
  end

  def created_date?(date)
    date_str = date.strftime('%Y-%m-%d')
    result = @created_date[date_str.to_sym]
    "#{result[:precure_name]}登場日" unless result.nil?
  end

  def movie_date?(date)
    date_str = date.strftime('%Y-%m-%d')
    result = @movie_started_date[date_str.to_sym]
    # format
    "#{result[:title]}映画公開日" unless result.nil?
  end

  def series_between(date)
    event_name = nil
    Rubicure::Series.config.each do |_k, v|
      if v[:started_date] == date
        event_name = "#{v[:title]}初放映"
        break
      end
      if v[:ended_date] == date
        event_name = "#{v[:title]}最終回"
        break
      end
      # Nobody expects the future. Precure series may be abolished today.
      v[:ended_date] = Date.today + 1 if v[:ended_date].nil?
      if v[:started_date] < date && date < v[:ended_date]
        event_name = "#{v[:title]}放映期間"
        break
      end
    end
    event_name
  end

  def hashize_cure_date
    @birth_date = {}
    @created_date = {}
    Precure.all_girls.each do |precure|
      # TODO: Support duplicated birthday
      birthday_key = precure.birthday.to_s.to_sym
      @birth_date[birthday_key] = precure if precure.have_birthday?
      # TODO: Support duplicated created_date
      created_date_key = precure.created_date.strftime('%Y-%m-%d').to_sym
      @created_date[created_date_key] = precure if precure.created_date
    end
  end

  def hashize_movie_date
    @movie_started_date = {}
    Rubicure::Movie.config.map do |_k, v|
      next if v[:started_date].nil?
      @movie_started_date[v[:started_date].strftime('%Y-%m-%d').to_sym] = v
    end
  end
end
