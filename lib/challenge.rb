require "time"

class Challenge
  attr_reader :earliest_time, :latest_time, :peak_year

  # Initializer
  def initialize(file_path)
    @file_path = File.expand_path(file_path)
  end

  # Parse method which sets the class properties
  def parse
    all_rows = {}
    peak = {}
    # Parsing the file and iterating over the rows
    File.open(@file_path, 'r').each_line do |row|
      row_time = Time.parse(row)
      all_rows[row_time.to_i] = row_time
      # Check if year exists in the hash
      if(peak.has_key?(row_time.year))
          peak[row_time.year] += 1 # if exist Increase the count
      else
          peak[row_time.year] = 1 # if not assign the one
      end
    end

    # Minimum timestamp in the all_rows will be earliest time
    @earliest_time = all_rows[all_rows.keys.min]
    # Maximum timestamp in the all_rows will be latest time
    @latest_time = all_rows[all_rows.keys.max]
    # Peak Year with maximum row counts
    @peak_year = peak.key(peak.values.max)
  end
end
