require 'spec_helper'
require  'benchmark'
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
