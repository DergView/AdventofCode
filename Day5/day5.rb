#!/usr/bin/env ruby

file_path = File.expand_path("../day5_input.txt", __FILE__)
input = File.read(file_path)

instructions = input.split("\n")
instructions = instructions[(10..-1)].map {|instruction| instruction.split(" ")}

stacks ={'1'=> %w(B P N Q H D R T),
        '2' => %w(W G B J T V),
        '3' => %w(N R H D S V M Q),
        '4' => %w(P Z N M C),
        '5' => %w(D Z B),
        '6' => %w(V C W Z),
        '7' => %w(G Z N C V Q L S),
        '8' => %w(L G J M D N V),
        '9' => %w(T P M F Z C G)
       }

instructions.each do |move|
        no_of_items = move[1].to_i
        source = move[3]
        destination = move[5]

        removals = stacks[source].pop(no_of_items).reverse # for the Part Two requirements just remove the .reverse here
        removals.each do |item|
          stacks[destination].push(item)
        end
end

answer = []
stacks.each do |stack|
        answer << stack[1][-1]
end

p answer.flatten.join("")