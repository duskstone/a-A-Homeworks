class LRUCache
    def initialize(size)
        @size = size 
        @underlying_array = []
    end

    def count
        @underlying_array.count 
      # returns number of elements currently in cache
    end

    def add(el)
        # adds element to cache according to LRU principle
        if @underlying_array.include?(el)
            @underlying_array.delete(el)
            @underlying_array << el 
        elsif count >= @size 
            @underlying_array.shift
            @underlying_array << el 
        else 
            @underlying_array << el 
        end 
    end

    def show
      # shows the items in the cache, with the LRU item first
      p @underlying_array
      nil
    end

    private
    # helper methods go here!

  end