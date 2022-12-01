# frozen_string_literal: true

module Aoc2022
  module Day1
    class Elf
      attr_reader :calories

      def self.from_str(str)
        elves = []

        elf = Elf.new
        str.split("\n").each do |line|
          if line.empty?
            elves << elf
            elf = Elf.new
          end
          elf.pickup!(line.to_i)
        end
        elves << elf

        elves
      end

      def initialize(calories: [])
        @calories = calories.sum
      end

      def pickup!(calories)
        @calories += calories
      end
    end

    module_function

    def solve(input)
      elves = Elf.from_str(input)

      elves.max_by(&:calories)
    end
  end
end
