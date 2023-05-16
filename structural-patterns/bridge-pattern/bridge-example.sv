class TimeImp;
    int hour;
    int minute;

    function new (int hour, int minute);
        this.hour = hour;
        this.minute = minute;
    endfunction

    virtual function void tell();
        $display("time is %02d:%02d", hour, minute);
    endfunction // tell
endclass // TimeImp

class CivilianTimeImp extends TimeImp;
    bit pm;

    function new(int hour, int minute, bit pm);
        super.new(hour, minute);
        this.pm = pm;
    endfunction // new

    virtual function void tell();
        $display("time is %02d:%02d%s", hour, minute, pm ? " PM" : " AM");
    endfunction // tell
endclass // CivilianTimeImp

class ZuluTimeImp extends TimeImp;
    string zone;

    function new(int hour, int minute, int zone);
        super.new(hour, minute);
        if (zone == 5)      this.zone = " Eastern Standard Time";
        else if (zone == 6) this.zone = " Central Standard Time";
    endfunction

    virtual function void tell();
        $display("time is %02d:%02d%s", hour, minute, zone);
    endfunction // tell
endclass // ZuluTimeImp

class Time;
    TimeImp imp;
    function new(int hour, int minute);
        imp = new(hour, minute);
    endfunction // new

    virtual function void tell();
        imp.tell();
    endfunction // tell
endclass // Time

class CivilianTime extends Time;
    function new(int hour, int minute, bit pm);
        CivilianTimeImp _imp = new(hour, minute, pm);
        super.new(hour, minute);
        imp = _imp;
    endfunction // new
endclass

class ZuluTime extends Time;
    function new(int hour, int minute, int zone);
        ZuluTimeImp _imp = new(hour, minute, zone);
        super.new(hour, minute);
        imp = _imp;
    endfunction // new
endclass


module top;
    initial begin
        Time times[3];
        Time _time = new(14, 30);
        CivilianTime _civilianTime = new(2, 30, 1);
        ZuluTime _zuluTime = new(14, 30, 6);

        times[0] = _time;
        times[1] = _civilianTime;
        times[2] = _zuluTime;

        for (int i = 0; i < 3; i++) begin
            times[i].tell();
        end

        $finish;
    end
endmodule // top
