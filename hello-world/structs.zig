const print = @import("std").debug.print;

const user = struct{id: u16, age: u8};

pub fn main() void {
    print("Hello World\n", .{});

    const player = user{
        .id = 1234,
        .age = 50
    };

    print("user.name = {d} user.age = {d}\n", .{player.id, player.age});
}