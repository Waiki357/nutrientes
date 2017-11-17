#  create  a  Struct  with  :value,  :next  and  :prev
Node  =  Struct.new(:value,  :next,  :prev)

#Clase LDE que es Una lista doblemente enlazada
class LDE
    attr_reader :head, :tail, :size
    include Enumerable

    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    #Obtienes el tamaño de la lista
    def size
        @size
    end

    #Funcion para el modulo enumerable
    def each
        tmp = @head
        while(tmp != nil)
            yield tmp
            tmp = tmp[:next]
        end
    end

    #Insertas elemento por el final
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

    #Insertas elemento por el principio
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

    #Sacas elemento por el principio
    def pop_front()
        if(@size!=0)
            head = @head
            @head = head.next
            @head.prev = nil
            @size -=1
            return head
        end
    end

    #Sacas elemento por el final
    def pop_back()
        if(@size!=0)
            tail = @tail
            @tail = tail.prev
            @tail.next = nil if @tail
            @size -=1
            return tail
        end
    end
end
