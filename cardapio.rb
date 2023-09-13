require_relative 'produto.rb'

class Cardapio
    def self.cardapio
        Produto.mostrar_produtos
    end
end
