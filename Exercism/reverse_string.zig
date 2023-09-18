const print = @import("std").debug.print;
const testing =  @import("std").testing;

pub fn main() void {
    print("Hello World\n", .{});
}

fn testReverse(comptime s: []const u8, expected: []const u8) !void {
    var buffer: [s.len]u8 = undefined;
    const actual = reverse(&buffer, s);
    try testing.expectEqualStrings(expected, actual);
}

pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    if (s.len == 0) {
        return buffer;
    }
    var idx: usize = s.len - 1;
    var i: usize = 0;
    while (i < s.len) : (i += 1) {
        buffer[i] = s[idx];
        if (idx == 0) {
            break;
        }
        idx-=1;
    }
    return buffer;
}

test "an empty string" {
    try testReverse("", "");
}

test "a word" {
    try testReverse("robot", "tobor");
}

test "a capitalized word" {
    try testReverse("Ramen", "nemaR");
}

test "a sentence with punctuation" {
    try testReverse("I'm hungry!", "!yrgnuh m'I");
}

test "a palindrome" {
    try testReverse("racecar", "racecar");
}

test "an even-sized word" {
    try testReverse("drawer", "reward");
}