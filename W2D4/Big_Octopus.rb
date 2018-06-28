#BIGGEST FISH
def longest_fish(fish) # O(n^2)
  fish.each_with_index do |el, idx|
    fish.each_with_index do |el2, idx2|
      next if idx == idx2

      fish[idx], fish[idx2] = fish[idx2], fish[idx] if el.length > el2.length
    end
  end
  fish.first
end

class Array
  def merge_sort(&prc) #dominant_octopus(fish), O(n log n)
    prc ||= Proc.new { |a,b| a<=>b }

    return self if length <= 1
    middle = length / 2

    Array.merge(self[0...middle].merge_sort(&prc), self[middle..-1].merge_sort(&prc), &prc)
  end

  def merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left[0], right[0])
      when 1
        merged << right.shift
      when 0
        merged << left.shift
        merged << right.shift
      when -1
        merged << left.shift
      end
    end
    merged + right + left
  end
end

def clever_octopus(fish) #O(n)
  max_length = fish.first.length
  max_idx = fish.first

  fish.each_with_index do |el, idx|
    if el.length > max_length
      max_length = el.length
      max_idx = idx
    end
  end

  fish[max_idx]
end

#DANCING OCTOPUS
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(tile_dir, tiles_array)
  tiles_array.each_with_index do |dir, idx|
    return idx if dir == tile_dir
  end
end

def fast_dance(tile_dir, tiles_array)
  tiles_array.index(tile_dir)
end
