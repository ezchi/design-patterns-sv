class Component1;
    function void doSomething();
        $display("Component1 doing something");
    endfunction // doSomething
endclass

class Component2;
    function void doSomething();
        $display("Component2 doing something");
    endfunction // doSomething
endclass

class Facade;
    local Component1 component1;
    local Component2 component2;

    function new();
        this.component1 = new();
        this.component2 = new();
    endfunction

    function void doSomething();
        component1.doSomething();
        component2.doSomething();
    endfunction
endclass

module top;
    initial begin
        Facade facade = new();

        facade.doSomething();

        $finish;
    end
endmodule
