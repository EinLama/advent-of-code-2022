# frozen_string_literal: true

require "colorize"

module Aoc2022
  module Day8
    class World
      def initialize(str)
        @map = str.split("\n").map do |line|
          line.split("").map(&:to_i)
        end
      end

      def width
        @map.first.length
      end

      def height
        @map.length
      end

      def tree_at(x, y)
        @map[y][x]
      end

      def count_visible_trees
        trees = 0
        (0...width).each do |x|
          (0...height).each do |y|
            trees += 1 if tree_visible?(x, y)
          end
        end

        trees
      end

      def tree_visible?(x, y)
        mytree = tree_at(x, y)

        check_left(mytree, x, y) || check_right(mytree, x, y) ||
          check_top(mytree, x, y) || check_bottom(mytree, x, y)
      end

      def check_left(tree, x, y)
        return true if x.zero?

        (0...x).all? { |c| tree > tree_at(c, y) }
      end

      def check_right(tree, x, y)
        return true if x >= width - 1

        ((x + 1)...width).all? { |c| tree > tree_at(c, y) }
      end

      def check_top(tree, x, y)
        return true if y.zero?

        (0...y).all? { |c| tree > tree_at(x, c) }
      end

      def check_bottom(tree, x, y)
        return true if y >= height - 1

        ((y + 1)...height).all? { |c| tree > tree_at(x, c) }
      end

      def print_map(with_visibles: false)
        (0...height).each do |y|
          (0...width).each do |x|
            tree = tree_at(x, y)
            if with_visibles && tree_visible?(x, y)
              print tree.to_s.green
            else
              print tree
            end
          end
          puts
        end
      end
    end

    module_function

    def solve_example(input)
      solve_part1(input)
    end

    def solve_part1(input)
      world = World.new(input)
      world.print_map(with_visibles: true)
      puts "-----------------"

      world.count_visible_trees
    end

    def solve_part2(input); end
  end
end
