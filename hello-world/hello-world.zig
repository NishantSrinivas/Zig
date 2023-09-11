const std = @import("std");

pub fn main() void {
    // debug.print takes two args!
    std.debug.print("Hello World!\n", .{});
}