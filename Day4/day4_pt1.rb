#!/usr/bin/env ruby

file_path = File.expand_path("../day4_input.txt", __FILE__)
input = File.read(file_path)

sections = input.split("\n")

total_contained = 0

total_section_overlaps = 0

sections.each do |section|
  section1, section2 = section.split(",")
  section1_start, section1_end = section1.split("-")
  section2_start, section2_end = section2.split("-")

  elf_section1 = (section1_start..section1_end)
  elf_section2 = (section2_start..section2_end)

  if (((elf_section1.include? section2_start) && (elf_section1.include? section2_end)) ||
       (elf_section2.include? section1_start) && (elf_section2.include? section1_end))
    total_contained += 1
  end

  if (((elf_section1.include? section2_start)) ||
       (elf_section2.include? section1_start))
    total_section_overlaps += 1
  end

end

p "The number of fully contained sections are #{total_contained}."
p "The total number of section overlaps is #{total_section_overlaps}."
