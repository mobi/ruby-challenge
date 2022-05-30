require "time"

class Challenge
  attr_reader :earliest_time
  attr_reader :latest_time
  attr_reader :peak_year

  def initialize(file_path)
    @file_path = File.expand_path(file_path)
  end

  def parse
    earliest_time = Time.now.to_i #converts current time into timestamp and saves it in the earlist_time local variable.
    latest_time = 0               #asign latest time local variable to have a starting value.
    peak_year = {}                #declare a hash for peak year.

    File.open(@file_path, 'r').each do |line| # For loop to iterate through every line in timestamps.txt file 
    
      timestamp_i = Time.xmlschema(line).to_i #converting 2022-05-30 11:56:52 -0400 into 1653926221 to reduce number off calls to Time and this will reduce the runtime
      timestamp = Time.xmlschema(line)

      #Logic for the earliest time in the data set
      earliest_time = earliest_time < timestamp_i ? earliest_time : timestamp_i

      #Logic for the latest time contained in the data set
      latest_time = latest_time > timestamp_i ? latest_time : timestamp_i

      #Logic for the peak year with the most number of timestamps contained in the data set
      peak_year.key?(timestamp.year) ? peak_year[timestamp.year] += 1 : peak_year[timestamp.year] = 1

   end
  
  @latest_time = Time.at(latest_time)
  @earliest_time = Time.at(earliest_time)
  @peak_year = peak_year.key(peak_year.values.max)
  end
end
