module Alimentos 

	Nodo = Struct.new(:valor, :siguiente, :previo)

 	class Lista
		include Enumerable
	       
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
		
		
		        # Saca un elemento de la última posición de la lista
		def pop_back
			    if @n_nodos == 0
				nil
			    elsif @n_nodos == 1
				valor_aux = @cola.valor
				@cola = @cola.previo
				@cabeza = @cola
				@n_nodos -= 1
				valor_aux
			    else
				valor_aux = @cola.valor
				@cola = @cola.previo
				@cola.siguiente = nil
				@n_nodos -= 1
				valor_aux
			    end
		end

		# Saca un elemento de la primera posición de la lista
		def pop_front
			    if @n_nodos == 0
				nil
			    elsif @n_nodos == 1
				valor_aux = @cabeza.valor
				@cabeza = @cabeza.previo
				@cola = @cabeza
				@n_nodos -= 1
				valor_aux
			    else
				valor_aux = @cabeza.valor
				@cabeza = @cabeza.siguiente
				@cabeza.previo = nil
				@n_nodos -= 1
				valor_aux
			    end
		end
	
			
		def each(&block)
		     	node_aux = Nodo.new(nil,nil,nil)
		       	node_aux = @cabeza
	    
		    while !(node_aux.nil?)
		       	yield node_aux.valor
	    
		         node_aux = node_aux.siguiente
		    end
		end 

 	end
end
