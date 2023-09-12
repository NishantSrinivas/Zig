const std = @import("std");

fn fib(x: i32) i32{
    if (x == 0 or x == 1) {
        return x;
    }

    return fib(x-1) + fib(x-2);
}

pub fn main() void {
    const res = fib(1000);

    std.debug.print("res = {d}\n", .{res});
}

// 0 1 1 2 3 5 8