## Sluggish Octopus
#O(n^2) time
#Do this by comparing all fish lengths to all other fish lengths

def sluggish_octopus(arr)
    fish = ""
    arr.each_with_index do |word1, idx1|
        arr.each_with_index do |word2, idx2|
            if idx1 < idx2
                if word1.length > word2.length
                    fish = word1
                else
                    fish = word2
                end
            end
        end
    end
    fish

end


## Dominant Octopus
#O(n log n)

def dominant_octopus(arr)
    return arr if arr.length <= 1
    pivot = arr.first
    left = arr.drop(1).select {|ele| ele.length < pivot.length}
    right = arr.drop(1).select {|ele| ele.length >= pivot.length}
    dominant_octopus(left) + [pivot] + dominant_octopus(right)
end

## Clever Octopus


def clever_octopus(arr)
    fish = ""
    (0...arr.length-1).each do |idx|
        if arr[idx].length < arr[idx+1].length
            fish = arr[idx+1]
        else
            fish = arr[idx]
        end
    end
    fish
end

## Dancing Octopus
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up"]


#Slow Dance O(n)
# slow_dance("up", tiles_array)
# > 0

# slow_dance("right-down", tiles_array)
# > 3

def slow_dance(dir, tiles_array)
    tiles_array.each_with_index {|ele,idx| idx if dir == ele}
end

#Fast Dance! O(1)
# fast_dance("up", new_tiles_data_structure)
# > 0

# fast_dance("right-down", new_tiles_data_structure)
# > 3
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up"]

tiles_hash = {}
tiles_array.each_with_index {|ele, idx| tiles_hash[ele] = idx}
def fast_dance(dir, tiles_hash)
    tiles_hash[dir]
end