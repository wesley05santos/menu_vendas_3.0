require_relative 'funcao.rb'

class Menu
    def self.menu
        puts "============================"
        puts "Digite a função desejada:"
        puts "============================\n\n"
        puts "[A] Adicionar Item"
        puts "[R] Remover Item"
        puts "[P] Pedido Resumo"
        puts "[F] Finalizar Pedido"
        puts "[V] Visualizar Cardápio"
        puts "[C] Cadastrar Novo Produto"
        chamar_dicionario
    end

    def self.dicionario
        {
            A: -> {Funcao.adicionar_item},
            R: -> {Funcao.remover_item},
            P: -> {Funcao.pedido_resumo},
            F: -> {Funcao.finalizar_pedido},
            V: -> {Funcao.visualizar_cardapio},
            C: -> {Funcao.cadastrar_novo_produto}           
        }
    end   


    def self.chamar_dicionario              
        result = dicionario[gets.chomp.upcase.to_sym]&.call        
        result ||=  funcao_invalida        
    end

    def self.retorna_menu
        clear
        puts "============================"
        puts "Retornando ao Menu....."
        puts "============================"
        sleep(2)
        clear
        puts menu
    end

    def self.clear
        system("clear")
    end

    def self.funcao_invalida
        puts <<~EOF
        ============================
        Função digitada inválida!!!
        ============================        
        EOF
        sleep(1)
        retorna_menu
    end   
end