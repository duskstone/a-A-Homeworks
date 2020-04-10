def sluggish_fish(arr)
    longest = arr[0]

    arr.each do |hold|
        arr.each do |compare|
            hold.length < compare.length
            longest = compare
        end 
    end 
    longest
end

def dominant_octopus(arr)
    return arr.dup if arr.length <= 1

    pivot_fish = arr.first 
    smaller_fish = arr.drop(1).select { |fish| fish.length < pivot_fish.length }
    bigger_fish = arr.drop(1).select { |fish| fish.length >= pivot_fish.length }

    sorted_small = dominant_octopus(smaller_fish)
    sorted_big = dominant_octopus(bigger_fish)

   sorted_fishes = [sorted_small] + [pivot_fish] + [sorted_big]
    sorted_fishes[-1]
end

def clever_octopus(arr)
    longest = arr[0]

    arr.each do |fish|
        longest = fish if fish.length > longest.length
    end
longest
end

def slow_dance(dir, tiles_array)
    tiles_array.each_with_index do |tile, i|
        return i if dir == tile 
    end        
end 

def fast_dance(dir, hash)
    hash[dir]
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p sluggish_fish(fish)
p dominant_octopus(fish)
p clever_octopus(fish)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)
new_tiles_data_structure = {
    "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3,
    "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7}
p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)