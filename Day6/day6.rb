#!/usr/bin/env ruby

file_path = File.expand_path("../day6_input.txt", __FILE__)
input = File.read(file_path)

def marker_detector(sample, partition_size)
  segments = sample.split("").each_cons(partition_size)

  segments.each_with_index do |segment,index|
    if segment.size == segment.uniq.size
       result = index + partition_size
       return result
    end
  end
end

puts "Part One - first marker after character: #{marker_detector(input,4)}"
puts "Part Two - first marker after character: #{marker_detector(input,14)}"