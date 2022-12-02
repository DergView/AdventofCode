#!/usr/bin/env ruby

file_path = File.expand_path("../day2_input.txt", __FILE__)
input = File.read(file_path)

opponent =[]
champ = []
required_outcome = []
total_score = 0
strategic_score = 0

scores = input.chomp.split("\n")

scores.map do |score|
  exploded = score.split(" ")
  opponent << exploded[0]
  champ << exploded[1]
  required_outcome << exploded[1]
end

game1 = {"X"=> {"A"=> 4, "B"=> 1, "C"=> 7},
         "Y"=> {"A"=> 8, "B"=> 5, "C"=> 2},
         "Z"=> {"A"=> 3, "B"=> 9, "C"=> 6}
        }

game2 = {"A"=> {"X"=> 3, "Y"=> 4, "Z"=> 8},
        "B"=> {"X"=> 1, "Y"=> 5, "Z"=> 9},
        "C"=> {"X"=> 2, "Y"=> 6, "Z"=> 7}
        }


champ.each_with_index do |score,index|
  total_score += game1[score][opponent[index]]
  strategic_score += game2[opponent[index]][score]
end

p "In Part 1, I scored #{total_score} points."

p "In Part 2, I scored #{strategic_score} points."