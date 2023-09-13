#require_relative 'menu.rb'

class Produto
    @@produtos = [{codigo: 1, nome: 'salada', preco: 14.99}, 
        {codigo: 2, nome: 'fritas', preco: 24.99},
        {codigo: 3, nome: 'hamburguer', preco: 29.99},
        {codigo: 4, nome: 'bebida', preco: 10.90},
        {codigo: 5, nome: 'sobremesa', preco: 7.00}]
    @@codigo = 1   

    def self.input_nome
        puts "Digite o nome do produto: "
        gets.chomp
    end

    def self.input_preco
        puts "Digite o preço do produto:"
        gets.chomp.to_f
    end

    def self.cadastra_produto
        nome = self.input_nome
        preco = self.input_preco     
        @@produtos.push({codigo: @@codigo, nome: nome, preco: preco})
        @@codigo += 1
        novo_cadastro?
    end

    def self.mostrar_produtos
        @@produtos.each do |produto|
            puts "[#{produto[:codigo]}]#{produto[:nome].to_s.ljust(24, '.').capitalize}R$#{'%.2f' %produto[:preco]}"
        end
    end

    def self.novo_cadastro?
        puts "Deseja continuar cadastrando produtos? [S/N]"
        resposta = gets.chomp.upcase               
        if resposta == 'S'
            cadastra_produto                      
        elsif resposta == 'N'
            Menu.retorna_menu                    
        else
            puts "============================"
            puts "Opção inválida"
            puts "============================"
            novo_cadastro?            
        end        
    end
end

# Produto.cadastra_produto
# Produto.novo_cadastro?
#Produto.mostrar_produtos