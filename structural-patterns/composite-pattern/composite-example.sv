interface class Component;
    pure virtual function void add(Component component);
    pure virtual function void remove(Component component);
    pure virtual function void traverse();
endclass

class Leaf implements Component;
    string name;

    function new(string name);
        this.name = name;
    endfunction

    function void add(Component component);
        // Not implemented
    endfunction

    function void remove(Component component);
        // Not implemented
    endfunction

    function void traverse();
        $display("Traversing %s", name);
    endfunction // traverse
endclass // Leaf

class Composite implements Component;
    local Component components[$];
    string name;

    function new(string name);
        this.name = name;
    endfunction

    function void add(Component component);
        components.push_back(component);
    endfunction

    function void remove(Component component);
        components.delete(component);
    endfunction

    function void traverse();
        $display("Traversing %s", name);
        foreach(components[i]) begin
            components[i].traverse();
        end
    endfunction
endclass // Composite

module top;
    initial begin
        Composite root = new("root");
        Leaf leaf1 = new("leaf1");
        Leaf leaf2 = new("leaf2");
        Leaf leaf3 = new("leaf3");

        root.add(leaf1);
        root.add(leaf2);
        root.add(leaf3);
        root.traverse();

        root.remove(leaf2);
        root.traverse();

        $finish();
    end;
endmodule
