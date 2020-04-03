class Map 

    def initialize
        @map = []
        # @recent_delete = []
    end

    def set(key, value) 
     @map << [key, value] if @map.empty?

     if key_check(key)
        @map.each { |pair| pair[1] = value if pair[0] == key }
     else 
        @map << [key, value] 
     end 
        value
    end

    def get(key)
        @map.each { |pair| return pair[1] if pair[0] == key }
        nil
    end

    # def undo
    #    @map << @recent_delete
    #    @recent_delete[1]
    #    @recent_delete = []
    #    p "last deleted item added back"
    # end

    def delete(key)
        value = get(key)
        @map.reject! { |pair| pair[0] == key }
        # @recent_delete << key 
        # @recent_delete << value 
        value
    end


    def show 
        @map
    end

    private

    attr_reader :map

    def key_check(key)
        @map.each do |pair|
        return true if pair[0] == key 
        end 
    false
    end

end