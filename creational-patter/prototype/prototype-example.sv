class Car;
    local string make;
    local string model;
    local int    year;

    function new(string make, string model, int year);
        this.make = make;
        this.model = model;
        this.year = year;
    endfunction // new

    static function Car Copy(Car prototype);
        Car car = new("no make", "no model", 0);
        car.make = prototype.make;
        car.model = prototype.model;
        car.year = prototype.year + 1;
        return car;
    endfunction // Copy

    function void print();
        $display("make: %s, model: %s, year: %0d", make, model, year);
    endfunction // print

endclass

module top;
    Car car1 = new("Toyota", "Camry", 2022);
    Car car2 = Car::Copy(car1);
    initial begin
        car1.print(); // Car: Toyota Camry 2022
        car2.print(); // Car: Toyota Camry 2023

        $finish;
    end
endmodule // top
