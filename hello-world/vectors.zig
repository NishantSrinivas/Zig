const print = @import("std").debug.print;

pub fn main() void {
    const zig_vec = @Vector(5, u8){1,2,3,4,5};

    for (0..5) |num| {
        print("{d}\n", .{zig_vec[num]});
    }
}