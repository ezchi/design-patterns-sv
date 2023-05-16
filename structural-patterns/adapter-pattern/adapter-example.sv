class Target;
    virtual function void doSomething();
    endfunction // doSomething
endclass

class Adaptee;
    function void doSomethingElse();
        $display("Adaptee");
    endfunction // doSomethingElse
endclass

class Adapter extends Target;
    local Adaptee adaptee;

    function new(Adaptee adaptee);
        this.adaptee = adaptee;
    endfunction // new

    function void doSomething();
        $display("Adpter around ");
        adaptee.doSomethingElse();
    endfunction
endclass

module top;
    initial begin
        Adaptee adaptee = new();
        Adapter adapter = new(adaptee);
        Target target = adapter;

        target.doSomething();

        $finish;
    end
endmodule // top
