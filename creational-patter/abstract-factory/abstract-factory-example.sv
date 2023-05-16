class Animal;
    virtual function void speak();
    endfunction // speak
endclass

class Dog extends Animal;
    virtual function void speak();
        $display("Woof!");
    endfunction
endclass

class Cat extends Animal;
    virtual function void speak();
        $display("Meow!");
    endfunction
endclass

class AnimalFactory;
    virtual function Animal createAnimal(string animalType);
        return null;
    endfunction // createAnimal
endclass

class DogFactory extends AnimalFactory;
    virtual function Animal createAnimal(string animalType);
        Dog dog = null;

        if (animalType == "dog") dog = new();

        return dog;
    endfunction
endclass

class CatFactory extends AnimalFactory;
    virtual function Animal createAnimal(string animalType);
        Cat cat = null;

        if (animalType == "cat") cat = new();

        return cat;
    endfunction
endclass

module top;
    AnimalFactory factory;
    Animal animal;

    DogFactory dogFactory = new();
    CatFactory catFactory = new();

    initial begin
        factory = dogFactory;

        animal = factory.createAnimal("dog");
        animal.speak();

        factory = catFactory;
        animal = factory.createAnimal("cat");
        animal.speak();

        $finish;
    end
endmodule // top
