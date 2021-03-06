# encoding: utf-8

module Toy
  class Direction
    NORTH = :north
    EAST  = :east
    SOUTH = :south
    WEST  = :west

    DIRECTION = [NORTH, EAST, SOUTH, WEST]

    class << self
      def rotate_left(direction)
        element(direction, -1)
      end

      def rotate_right(direction)
        element(direction, 1)
      end

      private

        def element(direction, index)
          raise Toy::Direction::Error::DirectionError unless Toy::Direction::DIRECTION.include?(direction)

          Toy::Direction::DIRECTION[(Toy::Direction::DIRECTION.index(direction) + index) % Toy::Direction::DIRECTION.size]
        end
    end
    
    module Error
      class DirectionError < ArgumentError
        def message
          'Invalid direction!'
        end
      end
    end
  end
end
