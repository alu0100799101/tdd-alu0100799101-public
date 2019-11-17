require 'spec_helper'

    RSpec.describe Alimentos::Nodo do
        before :all do
            @mi_nodo = Alimentos::Nodo.new(2,nil,nil)
        end
    
        describe "Atributos del nodo" do
            it "El nodo contiene los atributos datos, siguiente y previo" do
                expect(@mi_nodo).to have_attributes(:valor=>2)
                expect(@mi_nodo).to have_attributes(:siguiente=>nil)
                expect(@mi_nodo).to have_attributes(:previo=>nil)
            end
        end
    end 
	 RSpec.describe Alimentos::Lista do
		before :each do
		        @mi_lista = Alimentos::Lista.new()

		 end

		 describe "#Atributos de la lista" do
		        it "La lista tiene cabeza y cola" do
		            expect(@mi_lista).to have_attributes(:cabeza=>nil)
		            expect(@mi_lista).to have_attributes(:cola=>nil)
		        end
			it "La lista esta vacia" do
			    expect(@mi_lista.empty?).to eq(true)
               		end

		end
		describe "#Funcionalidad de la lista" do
			it "Se puede insertar un elemento al principio y final de la lista" do
		            expect(@mi_lista).to respond_to (:push_back)
		            @mi_lista.push_back(1003)
		            expect(@mi_lista.back).to eq(1003)
		            expect(@mi_lista).to respond_to (:push_front)
		            @mi_lista.push_front('Pepe')
		            expect(@mi_lista.front).to eq('Pepe')
			end
                end


	end

