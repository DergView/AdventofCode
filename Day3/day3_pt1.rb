#!/usr/bin/env ruby

file_path = File.expand_path("../day3_input.txt", __FILE__)
input = File.read(file_path)

rucksack_contents = input.split("\n")

total = 0

alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

priorities = {}

alphabet.chars.each_with_index do |letter, index|
  priorities[letter]= index+1
end

rucksack_contents.each do |rucksack|
  mixed_compartment = rucksack.chars

  compartment1 = mixed_compartment[0..(mixed_compartment.size/2)-1]
  compartment2 = mixed_compartment[(mixed_compartment.size/2..-1)]
  common = compartment1.intersection(compartment2)
  total += priorities[common[0]]
end

puts "The elves priority total is #{total}."