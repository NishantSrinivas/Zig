const std = @import("std");

fn fib(x: i32) i32{
    if (x == 0 or x == 1) {
        return x;
    }

    return fib(x-1) + fib(x-2);
}

pub fn main() void {
    const res = fib(10);

    std.debug.print("res = {d}\n", .{res});

    // Defer -> executes when exiting of code block
    var num: u8 = 10;
    {
        defer num += 10;
        // Num should be 10 only here
        std.debug.print("num = {d}\n", .{num});
    }

    // Num should be 20 here
    std.debug.print("num after defer = {d}\n", .{num});

    // Defer stacking
    {
        defer num *= 3;
        defer num += 10;
        // Num should be 20 only here
        std.debug.print("num = {d}\n", .{num});
    }

    // Num should be 90 here
    std.debug.print("num after defer = {d}\n", .{num});

}

// 0 1 1 2 3 5 8