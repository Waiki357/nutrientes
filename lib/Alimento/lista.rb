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

    #Obtienes el tama�o de la lista
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

    def list_to_array()
        self.map { |e| e[:value] }
    end

    def ord_for
        s = self.list_to_array
        for i in 1..(s.size-1)
          for j in 0..(s.size-i-1)
            if s[j].valor_energetico > s[j+1].valor_energetico
              s[j],s[j+1] = s[j+1],s[j]
            end
          end
        end
        s
    end

    def ord_each
        s = self.list_to_array
        (1..(s.size-1)).each do |i|
          (0..(s.size-i-1)).each do |j|
            if s[j].valor_energetico > s[j+1].valor_energetico
              s[j],s[j+1] = s[j+1],s[j]
            end
          end
        end
        s
    end

    def ord_sort
      s = self.list_to_array
      s.sort { |a,b| a.valor_energetico <=> b.valor_energetico }
    end
end
