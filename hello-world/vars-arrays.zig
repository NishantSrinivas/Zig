const std = @import("std");

pub fn main() void {
    std.debug.print("Variables and Arrays!!\n", .{});

    const constant: u32 = 100;
    var variable: u32 = 200;

    std.debug.print("variable = {d} constant = {d}\n", .{variable,constant});

    // We can modify the variable
    variable += 100;

    // Let's see what the variable is now
    std.debug.print("variable = {d}\n", .{variable});

    // We can't do this 
    // constant -= 50; error: cannot assign to constant
    std.debug.print("constant = {d}\n", .{constant});

}