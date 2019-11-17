module Alimentos 

	Nodo = Struct.new(:valor, :siguiente, :previo)

 class Lista
       
        attr_reader :n_nodos, :cabeza, :cola
        
        def initialize 
            @n_nodos = 0 # número de nodos, tamaño de la lista
            @cabeza = nil
            @cola = nil
        end

	 def empty?
	      if @cabeza == nil
	       return true
	      else 
		return false
	      end
	 end
	
	#Inserta Valor ultima posición de la lista
	 def push_back(valor)
            nodo_aux = Nodo.new(valor, nil, nil)
            if @n_nodos == 0
                @cabeza = @cola = nodo_aux
            else
                nodo_aux.previo = @cola
                @cola.siguiente = nodo_aux
                @cola = nodo_aux
            end
            @n_nodos+=1
        end

        def back
            @cola.valor
        end
        # Inserta un elemento en la primera posición de la lista
        def push_front(valor)
            nodo_aux = Nodo.new(valor, nil, nil)
            if @n_nodos == 0
                @cabeza = @cola = nodo_aux
            else
                nodo_aux.siguiente = @cabeza
                @cabeza.previo = nodo_aux
                @cabeza = nodo_aux
            end
            @n_nodos+=1
        end
        
        def front
            @cabeza.valor
        end

  end
end
