const std = @import("std");
const testing = std.testing;

pub const ColorBand = enum {
    black,
    brown,
    red,
    orange,
    yellow,
    green,
    blue,
    violet,
    grey,
    white,
};

pub fn colorCode(color: ColorBand) usize {
    // @compileError("determine the value of a colorband on a resistor");
    return @intFromEnum(color);
}

pub fn colors() []const ColorBand {
    // @compileError("refer to a collection of all resistor colorbands");
    const result = &[_]ColorBand{ColorBand.black, ColorBand.brown, ColorBand.red,
                               ColorBand.orange, ColorBand.yellow, ColorBand.green,
                               ColorBand.blue, ColorBand.violet, ColorBand.grey,             
                               ColorBand.white};
    return result;
}

test "black" {
    const expected: usize = 0;
    const actual = colorCode(.black);
    try testing.expectEqual(expected, actual);
}
test "white" {
    const expected: usize = 9;
    const actual = colorCode(.white);
    try testing.expectEqual(expected, actual);
}
test "orange" {
    const expected: usize = 3;
    const actual = colorCode(.orange);
    try testing.expectEqual(expected, actual);
}
test "colors" {
    const expected = &[_]ColorBand{
        .black, .brown, .red,    .orange, .yellow,
        .green, .blue,  .violet, .grey,   .white,
    };
    const actual = colors();
    try testing.expectEqualSlices(ColorBand, expected, actual);
}
