const print = @import("std").debug.print;

pub fn main() void {
    const zig_vec = @Vector(5, u8){1,2,3,4,5};
    const zig_vec_2 = @Vector(5, u8){6,7,8,9,10};

    for (0..5) |num| {
        print("{d} ", .{zig_vec[num]});
    }
    print("\n", .{});
    for (0..5) |num| {
        print("{d} ", .{zig_vec_2[num]});
    }
    print("\n", .{});
    const zig_vec_3 = zig_vec + zig_vec_2;

    for (0..5) |num| {
        print("{d} ", .{zig_vec_3[num]});
    }
    print("\n", .{});
}