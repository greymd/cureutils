# coding: utf-8
require 'date'
#
# Date class supports the precure format
#
class CureDateChecker
  class << self
    def events(date)
      create_hash
      event_list = [birth_date?(date),
                    created_date?(date),
                    movie_date?(date),
                    series_between(date)].compact
      event_list.join('/')
    end

    private

    def create_hash
      hashize_cure_date unless @birth_date || @created_date
      hashize_movie_date unless @movie_started_date
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
end
