require "time"

class Challenge
  attr_reader :earliest_time, :latest_time, :peak_year

  def initialize(file_path)
    @file_path = File.expand_path(file_path)
  end

  def parse
    all_rows = {}
    peak = {}
    File.open(@file_path, 'r').each_line do |row|
      row_time = Time.parse(row)
      all_rows[row_time.to_i] = row_time
      if(peak.has_key?(row_time.year))
          peak[row_time.year] += 1
      else
          peak[row_time.year] = 1
      end
    end

    @earliest_time = all_rows[all_rows.keys.min]
    @latest_time = all_rows[all_rows.keys.max]
    @peak_year = peak.key(peak.values.max)
  end
end
