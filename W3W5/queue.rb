class Queue 

    def initialize 
        @queue = []
    end 

    def enqueue(el)
        @queue.push(el)
        el
    end

    def dequeue
        @queue.shift
    end

    def peek 
        @queue[-1]
    end

    private 

    attr_reader :queue
end