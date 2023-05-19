interface class Beverage;
    pure virtual function string get_name();
    pure virtual function int get_cost();
endclass

class Coffee implements Beverage;
    string name;
    int    cost;

    function new();
        this.name = "Coffee";
        this.cost = 100;
    endfunction

    virtual function string get_name();
        return name;
    endfunction

    virtual function int get_cost();
        return cost;
    endfunction // get_cost
endclass // Coffee

class Milk implements Beverage;
    local Beverage beverage;

    function new(Beverage beverage);
        this.beverage = beverage;
    endfunction // new

    virtual function string get_name();
        return $sformatf("%s with milk", beverage.get_name());
    endfunction // get_name

    virtual function int get_cost();
        return beverage.get_cost() + 50;
    endfunction
endclass

class Mocha implements Beverage;
    local Beverage beverage;

    function new(Beverage beverage);
        this.beverage = beverage;
    endfunction

    virtual function string get_name();
        return $sformatf("%s with mocha", beverage.get_name());
    endfunction

    virtual function int get_cost();
        return beverage.get_cost() + 100;
    endfunction // get_cost
endclass // Mocha

module top;
    initial begin
        Coffee coffee = new();
        Milk milkCoffee = new(coffee);
        Mocha mochaCoffee = new(milkCoffee);

        $display("Name: %s, Cost: %d", mochaCoffee.get_name(), mochaCoffee.get_cost());

        $finish;
    end
endmodule // top
