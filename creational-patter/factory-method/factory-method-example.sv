interface class Shape;
    pure virtual function void draw();
endclass

class Rectangle implements Shape;
    function void draw();
        $display("Drawing a rectangle");
    endfunction
endclass

class Circle implements Shape;
    function void draw();
        $display("Drawing a circle");
    endfunction
endclass

class ShapeFactory;
    static function Shape createShape(string shapeType);
        if (shapeType == "rectangle") begin
            Rectangle newShape = new();
            return newShape;
        end
        else if (shapeType == "circle") begin
            Circle newShape = new();
            return newShape;
        end
        else begin
            $display("Invalid shape type");
            return null;
        end
    endfunction
endclass

module top;
    Shape myShape;
    initial begin
        myShape = ShapeFactory::createShape("rectangle");
        myShape.draw();
        myShape = ShapeFactory::createShape("circle");
        myShape.draw();
        myShape = ShapeFactory::createShape("triangle");
        if (myShape != null) begin
            myShape.draw();
        end
        $finish;
    end
endmodule
