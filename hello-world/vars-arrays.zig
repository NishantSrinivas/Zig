const std = @import("std");

pub fn main() void {
    std.debug.print("Variables and Arrays!!\n", .{});

    // Variables
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

    // Arrays
    const my_array = [10]u8{1,2,3,4,5,6,7,8,9,10}; // Program doesn't run if we have unused vars!!

    std.debug.print("{d}\n", .{my_array[9]});

    const len_my_array = my_array.len;
    std.debug.print("len of my array is {d}\n", .{len_my_array});

}