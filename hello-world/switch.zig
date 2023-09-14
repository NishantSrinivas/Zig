const std = @import("std");

pub fn main() void {
    // Try playing around with this value;
    var num: u8 = 101;

    switch(num) {
        1...20 => {
            std.debug.print("the num is {d}\n", .{num});
        },
        50, 100 => { 
            std.debug.print("num is either 50 or 100\n", .{});
        },
        else => {
            std.debug.print("else has been executed\n", .{});
        }
    }

    const num_from_switch: u8 = switch(num) {
        1...20 => num * 10,
        50, 100 => num / 10,
        else => undefined // undefined will be coersed to 0!!
    };

    std.debug.print("num_from_switch is {d}\n", .{num_from_switch});

    {
        @setRuntimeSafety(false); // not working when I tried with zig run switch.zig
        const arr = [5]u8{1,2,3,4,5};

        // Let's try to access the 5th index!!
        const index = 3;
        const x: u8 = arr[index]; // should break here!

        std.debug.print("x = {d}\n", .{x});
    }
    
    const str = "Hello World!!";

    std.debug.print("{s}\n", .{str});

    // unreachable

    var some_val: u8 = 10;

    switch(some_val) {
        10 => {
            std.debug.print("This will always execute as some val is always 10\n", .{});
        },
        else => unreachable,
    }
}