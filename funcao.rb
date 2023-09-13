require_relative 'produto.rb'
require_relative 'cardapio'

class Funcao    
    def self.adicionar_item
        puts 1
    end

    def self.remover_item
        puts 2
    end

    def self.pedido_resumo
        puts 3
    end

    def self.finalizar_pedido
        puts 4
    end

    def self.visualizar_cardapio
        Cardapio.cardapio
    end

    def self.cadastrar_novo_produto
        Produto.cadastra_produto
    end
end