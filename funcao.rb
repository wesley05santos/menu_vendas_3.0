# require_relative 'produto.rb'
require_relative 'cardapio.rb'
# require_relative 'menu.rb'

class Funcao
    @pedido = []
    @total_pedido = 0
    
    def self.adicionar_item
        Cardapio.cardapio
        puts "Digite o código do produto: "
        codigo_digitado = gets.chomp.to_i       
        produtos = Produto.class_variable_get(:@@produtos).select {|produto|produto[:codigo].to_i == codigo_digitado}
        #binding.irb
        if produtos.empty?
            puts "============================"
            puts "Código inválido!"
            puts "Digite novamente!"
            puts "============================\n\n"
            adicionar_item
        else
            produto = produtos.first
            @pedido << produto[:nome]
            @total_pedido += produto[:preco]
            puts "Deseja continuar adicionando itens!!! [s/n]"
            resposta = gets.chomp.upcase
            if resposta == "S"
                adicionar_item
            elsif resposta == "n"
                Menu.retorna_menu
            else
                puts "============================"
                puts "Opção inválida!"
                puts "============================"
                sleep(1)
            end
        end
        Menu.retorna_menu     
    end 

    def self.remover_item
        if @pedido.empty?
            puts "=============================="
            puts "Não há ITEM lançado no pedido!"
            puts "=============================="
            sleep(2)
            Menu.retorna_menu
        else
            @pedido.each.with_index { |item_cancela, index| puts "#{index + 1} --- #{item_cancela.capitalize}" }    
            puts "Digite o NÚMERO do item que deseja CANCELAR: "
            index_delete = gets.chomp.to_i  
            item_deletado = @pedido.delete_at(index_delete - 1)        
            produtos = Produto.class_variable_get(:@@produtos).select {|produto|produto[:nome] == item_deletado}
            produto = produtos.first
            @total_pedido = @total_pedido - produto[:preco].to_f
        end
    end

    def self.pedido_resumo
        puts "=" * 42
        puts "RESUMO DO PEDIDO: "
        puts "=" * 42
        @pedido.each.with_index{ |item, index| puts "#{index + 1} ----- #{item.capitalize}"}   
        puts "=" * 42    
        puts "TOTAL PEDIDO => R$ #{@total_pedido.round 2}."
    end


    def self.finalizar_pedido
        pedido_resumo
        puts "Obrigado pela preferência!!!"
    end

    def self.visualizar_cardapio
        #Cardapio.cardapio
    end

    def self.cadastrar_novo_produto
        #Produto.cadastra_produto
    end
end