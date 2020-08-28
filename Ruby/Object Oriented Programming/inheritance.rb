# Inheritance of classes
class Animal
    attr_reader :species

    def initialize(species)
        @species = species
    end
end

class Human < Animal
    attr_reader :name

    def initialize(name)
        # super calls the original definition of the method
        # If we hadn't passed "Homo Sapiens" to super, then `name` would have
        # been passed by default.
        super("Homo Sapiens")
        @name = name
    end
end