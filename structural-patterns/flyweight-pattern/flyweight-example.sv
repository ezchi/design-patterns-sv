class SharedState;
    string brand;
    string model;
    string color;

    function new(string brand, string model, string color);
        this.brand = brand;
        this.model = model;
        this.color = color;
    endfunction // new

    function string convert2string();
        return $sformatf("[ %s , %s , %s ]", brand, model, color);
    endfunction // convert2string

    // function void copy(ShareState orig);
    //     this.brand = orig.brand;
    //     this.model = orig.model;
    //     this.color = orig.color;
    // endfunction // copy

    // function ShareState clone(ShareState orig);
    //     ShareState _item;

    //     $cast(_item, orig);

    //     return _item;
    // endfunction // clone
endclass // SharedState

class UniqueState
    string owner;
    string plates;

    function new(string owner, string plates);
        this.owner = owner;
        this.plates = plates;
    endfunction // new

    function string convert2string();
        return $sformatf("[ %s , %s ]", owner, plates);
    endfunction // convert2string
endclass

class Flyweight;
    local SharedState shared_state;

    function set_shared_state(SharedState shared_state);
        this.shared_state = shared_state;
    endfunction // set_shared_state

    function get_shared_state();
        return shared_state;
    endfunction

    function void Operation(UniqueState unique_state);
        $display("Flyweight: Displaying shared (%s) and unique (%s) state", shared_state.convert2string(), unique_state.convert2string());
    endfunction // Operation
endclass // Flyweight

class FlyweightFactory;
    local Flyweight flyweights[string];

    function string get_key(SharedState shared_state);
        return $sformatf("%s_%s_%s", shared_state.brand, shared_state.model, shared_state.color);
    endfunction // get_key

    function new(SharedState share_states[$]);
        foreach(share_states[i]) begin
            flyweights[get_key(share_states[i])] = stare_states[i];
        end
    endfunction // new

    function Flyweight GetFlyweight(SharedState shared_state);
        string key = get_key(shared_state);
        if (flyweights.exisits(key)) begin
            $display("FlyweightFactory: Reusing existing flyweight.");
        end else begin
            $display("FlyweightFactory: Can't find a flyweight, creating new one.");
            flyweights[key] = shared_state;
        end

        return flyweights[key];
    endfunction

    function void ListFlyweights();
        $display("FlyweightFactory: I have %0d flyweights.", flyweights.size());

        foreach(flyweights[i]) begin
            $display("%s", i);
        end
    endfunction
endclass // FlyweightFactory

        // void AddCarToPoliceDatabase(
        //     FlyweightFactory &ff, const std::string &plates, const std::string &owner,
        //     const std::string &brand, const std::string &model, const std::string &color)
        // {
        //     std::cout << "\nClient: Adding a car to database.\n";
        //     const Flyweight &flyweight = ff.GetFlyweight({brand, model, color});
        //     // The client code either stores or calculates extrinsic state and passes it
        //     // to the flyweight's methods.
        //     flyweight.Operation({owner, plates});
        // }


module top;
    FlyweightFactory factory;

    initial begin

        // = new FlyweightFactory({{"Chevrolet", "Camaro2018", "pink"}, {"Mercedes Benz", "C300", "black"}, {"Mercedes Benz", "C500", "red"}, {"BMW", "M5", "red"}, {"BMW", "X6", "white"}});
            // factory->ListFlyweights();

            // AddCarToPoliceDatabase(*factory,
            //     "CL234IR",
            //     "James Doe",
            //     "BMW",
            //     "M5",
            //     "red");

            // AddCarToPoliceDatabase(*factory,
            //     "CL234IR",
            //     "James Doe",
            //     "BMW",
            //     "X1",
            //     "red");
            // factory->ListFlyweights();
            // delete factory;

            // return 0;
    end
endmodule // top
