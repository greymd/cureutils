# coding: utf-8
require 'date'

#
# Date class supports the precure format
#
class DateLogic
  def initialize
    hashize_cure_date unless @birth_date || @created_date
    hashize_movie_date unless @movie_started_date
    @datetime = Time.now
    @format = '+%F %H:%M:%S @P'
    @out = $stdout
  end

  def source_output(output = $stdout)
    @out = output
  end

  def datetime(datetime_str)
    @datetime = datetime_str ? natural_lang2time(datetime_str) : Time.now
  end

  attr_writer :format

  def print_results
    updated_fmt = update_fmt(@datetime, @format)
    @out.puts @datetime.strftime(updated_fmt)
    0
  end

  private

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

  def update_fmt(datetime, fmt)
    # Find precure related events
    date4check_event = time2date(datetime)
    found_event = events(date4check_event)
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
    date_str = date.strftime('%m/%d')
    result = @birth_date[date_str]
    # format
    result.nil? ? nil : "#{result[:human_name]}(#{result[:precure_name]})誕生日"
  end

  def created_date?(date)
    date_str = date.strftime('%m/%d')
    result = @created_date[date_str]
    # format
    result.nil? ? nil : "#{result[:precure_name]}初登場日"
  end

  def movie_date?(date)
    result = @created_date[date]
    # format
    result.nil? ? nil : "#{result[:title]}映画公開日"
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
    Rubicure::Girl.config.map do |_k, v|
      v[:birthday].nil? || @birth_date[v[:birthday]] = v
      v[:created_date].nil? || @created_date[v[:created_date]] = v
    end
  end

  def hashize_movie_date
    @movie_started_date = {}
    Rubicure::Movie.config.map do |_k, v|
      v[:started_date].nil? || @movie_started_date[v[:started_date]] = v
    end
  end
end
