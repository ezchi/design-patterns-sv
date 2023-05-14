class MyClass;
    local int id;
    static local MyClass myClass;

    function new();
        id = $urandom();
    endfunction // new

    static function MyClass getInstance();
        if (myClass == null) begin
            myClass = new();
        end
         return myClass;
    endfunction // getInstance
endclass

module top;
    initial begin
        $display("Create with non-singleton pattern");
        repeat(5) begin
            MyClass my_class = new();

            $display("%p", my_class);
        end

        $display("Create with singleton pattern");
        repeat(5) begin
            MyClass my_class = MyClass::getInstance();
            $display("%p", my_class);
        end

        $finish;
    end
endmodule // top
