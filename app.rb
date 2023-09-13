require_relative 'menu.rb'

class App
    def initialize
        Menu.menu        
    end
end

App.new