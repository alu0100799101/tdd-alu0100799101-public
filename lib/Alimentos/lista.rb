module Alimentos 

	Nodo = Struct.new(:valor, :siguiente, :previo)

 class Lista
       
        attr_reader :n_nodos, :cabeza, :cola
        
        def initialize 
            @n_nodos = 0 # número de nodos, tamaño de la lista
            @cabeza = nil
            @cola = nil
        end


  end
end
