#!/usr/bin/env ruby

file_path = File.expand_path("../day1_input.txt", __FILE__)
input = File.read(file_path)

hungry_elves = input.split("\n\n").map{|s| s.split("\n")}.map{|s| s.map(&:to_i)}

def count(a,total)
  total += a
  return total
end

totals= []

 hungry_elves.each do |elf|
  sum = 0

  elf.each do |e|
    sum = count(e,sum)
  end
totals << sum
 end

  hungriest_elf = (totals.index(totals.max)) + 1

  guzzlers = totals.sort
  top_3_calories = guzzlers[-1] + guzzlers[-2] + guzzlers[-3]

  p "Part 1: The hungriest elf is Elf number: #{hungriest_elf} with #{totals.max} calories."
  p "Part 2: The 3 hungriest Elves have devoured, #{top_3_calories} calories amongst them."