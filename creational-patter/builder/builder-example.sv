class House;
    local string foundation;
    local string walls;
    local string roof;

    function void setFoundation(string foundation);
        this.foundation = foundation;
    endfunction // setFoundation

    function void setWalls(string walls);
        this.walls = walls;
    endfunction // setWalls

    function void setRoof(string roof);
        this.roof = roof;
    endfunction // setRoof

    function void print();
        $display("%p", this);
    endfunction // print
endclass


class HouseBuilder;
    local House house;

    function House Build(string foundation, string walls, string roof);
        house = new();

        setFoundation(foundation);
        setWalls(walls);
        setRoof(roof);

        return house;
    endfunction // HouseBuilder

    function void setFoundation(string foundation);
        house.setFoundation(foundation);
    endfunction // setFoundation

    function void setWalls(string walls);
        house.setWalls(walls);
    endfunction // setWalls

    function void setRoof(string roof);
        house.setRoof(roof);
    endfunction // setRoof
endclass


module top;
    HouseBuilder builder = new();
    House house;

    initial begin
        house = builder.Build("concrete", "brick", "wood");

        house.print();

        $finish;
    end
endmodule // top
