# frozen_string_literal: true

require_relative "aoc2022/version"
require_relative "aoc2022/day1"

module Aoc2022
  class Error < StandardError; end

  module_function

  # Reads a file from `input/`, expects the filename without
  # folder or path.
  #
  # read_input("1_example.txt") # will read and return `input/1_example.txt`
  def read_input(filename)
    File.read(File.join("input", filename))
  end
end

if __FILE__ == $PROGRAM_NAME
  f = Aoc2022.read_input("1_part1.txt")
  elf = Aoc2022::Day1.solve(f)
  puts elf.calories
end
