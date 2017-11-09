require "Alimento/alimento"

#  create  a  Struct  with  :value,  :next  and  :prev
Node  =  Struct.new(:value,  :next,  :prev)

class LDE
    attr_reader :head, :tail, :size

    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    def size
        @size
    end

    def push_back(valor)
        node = Node.new(valor,nil,nil)
        if(@size==0)
            @head = node
            @tail = node
            @size +=1
        elsif
            @tail.next = node
            node.prev = @tail
            @tail=node
            @size +=1
        end
        true
    end

    def push_front(valor)
        node = Node.new(valor,nil,nil)
        if(@size==0)
            @head = node
            @tail = node
            @size +=1
        elsif
            @head.prev = node
            node.next = @head
            @head=node
            @size +=1
        end
        true
    end
end
