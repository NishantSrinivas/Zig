const std = @import("std");
const testing = std.testing;

pub fn isIsogram(str: []const u8) bool {
    var result = true;

    const AutoHashMap = std.AutoHashMap;

    var char_present = AutoHashMap(u8, u8).init(std.heap.page_allocator);
    defer char_present.deinit();

    for (str) |chr| {
        var tmp = chr;
        if (tmp >= 65 and tmp <= 90) {
            tmp = chr + 32;
        }
        
        if (tmp == '-' or tmp == ' ') {
            continue;
        }

        if (char_present.contains(tmp) == true) {
            result = false;
            break;
        } else {
            const x = char_present.put(tmp, 1);
            _ = x catch {};
        }
    }

    return result;
}

test "empty string" {
    try testing.expect(isIsogram(""));
}
test "isogram with only lower case characters" {
    try testing.expect(isIsogram("isogram"));
}
test "word with one duplicated character" {
    try testing.expect(!isIsogram("eleven"));
}
test "word with one duplicated character from the end of the alphabet" {
    try testing.expect(!isIsogram("zzyzx"));
}
test "longest reported english isogram" {
    try testing.expect(isIsogram("subdermatoglyphic"));
}
test "word with duplicated character in mixed case" {
    try testing.expect(!isIsogram("Alphabet"));
}
test "word with duplicated character in mixed case, lowercase first" {
    try testing.expect(!isIsogram("alphAbet"));
}
test "hypothetical isogrammic word with hyphen" {
    try testing.expect(isIsogram("thumbscrew-japingly"));
}
test "hypothetical word with duplicated character following hyphen" {
    try testing.expect(!isIsogram("thumbscrew-jappingly"));
}
test "isogram with duplicated hyphen" {
    try testing.expect(isIsogram("six-year-old"));
}
test "made-up name that is an isogram" {
    try testing.expect(isIsogram("Emily Jung Schwartzkopf"));
}
test "duplicated character in the middle" {
    try testing.expect(!isIsogram("accentor"));
}
test "same first and last characters" {
    try testing.expect(!isIsogram("angola"));
}
test "word with duplicated character and with two hyphens" {
    try testing.expect(!isIsogram("up-to-date"));
}
