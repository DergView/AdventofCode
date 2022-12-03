#!/usr/bin/env ruby

file_path = File.expand_path("../day3_input.txt", __FILE__)
input = File.read(file_path)

rucksack_contents = input.split("\n")

total = 0

alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

priorities = {}

alphabet.chars.each_with_index do |letter, index|
  priorities[letter] = index+1
end

groups =  rucksack_contents.each_slice(3).to_a

 groups.each do |group|
  rucksack1 = group[0].chars
  rucksack2 = group[1].chars
  rucksack3 = group[2].chars
  common_badge = rucksack1.intersection(rucksack2).intersection(rucksack3)

  total += priorities[common_badge[0]]
end

puts "The common badge total is #{total}."