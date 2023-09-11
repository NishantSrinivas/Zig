const std = @import("std");

pub fn main() void {
    // Conditions and loops

    // Conditions
    const my_bool = true;

    // condition should be true or false only
    if (my_bool) {
        std.debug.print("My bool was true\n", .{});
    } else {
        std.debug.print("My bool was false\n", .{});
    }

    // if returning variable
    const my_var:u8 = if (my_bool) 100 else 200;

    std.debug.print("My var is {d}\n", .{my_var});

    // Loops

    // While loop
    var i: u32 = 10;
    // integer overflow
    // while (i > -1) : (i -= 1) {
    //     std.debug.print("i = {d}\n",.{i});
    // }

    while (i > 0) : (i -= 1) {
        std.debug.print("i = {d}\n",.{i});
    }
    std.debug.print("\n",.{});
    // Continue
    i = 10;
    while (i > 0) : (i -= 1) {
        if (i == 5) continue;
        std.debug.print("i = {d}\n",.{i});
    }

    std.debug.print("\n",.{});
    // Break
    i = 10;
    while (i > 0) : (i -= 1) {
        if (i == 5) break;
        std.debug.print("i = {d}\n",.{i});
    }

    // For loop
    const my_arr = [5]u8{1,2,3,4,5};

    for (my_arr) |num, idx| {
        var x = num;
        var y = idx;
        std.debug.print("idx = {d} num = {d}\n",.{y,x});
    }

    // Doesn't work
    // for (0..5) |num| {
    //     std.debug.print("num = {d}\n",.{num});
    // }

}