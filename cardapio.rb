require_relative 'produto.rb'

class Cardapio
    def self.cardapio
        Menu.clear
        puts "========================================"
        puts "***************CARDÁPIO*****************"
        puts "========================================"
        Produto.mostrar_produtos
        puts "\n========================================"
        puts "Pressione 0(zero), para retornar ao menu"
        puts "========================================"
        resposta = gets.chomp.to_i
        if resposta == 0
            Menu.retorna_menu
        else
            puts "============================"
            puts "Opção inválida!"
            puts "============================"
        end
    end
end