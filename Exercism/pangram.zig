const print = @import("std").debug.print;
const testing = @import("std").testing;

pub fn main() void {
    print("Hello\n", .{});

    const res = isPangram("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG");
    print("{}\n", .{res});
}

fn isPangram(str: []const u8) bool {
    var char_pre = [_]u8{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    
    for (str) |chr| {
        var cc = chr;

        // Upper to lower case conversion
        if (cc >= 65 and cc <= 90) {
            cc += 32; 
        }

        if (cc >= 97 and cc <= 122) {
            char_pre[(cc-97)] = 1;
        }
    }

    var res = true;

    for (char_pre) |i| {
        if (i != 1) {
            res = false;
            break;
        }
    }
 
    return res;
}

test "empty sentence" {
    try testing.expect(!isPangram(""));
}
test "perfect lower case" {
    try testing.expect(isPangram("abcdefghijklmnopqrstuvwxyz"));
}
test "only lower case" {
    try testing.expect(isPangram("the quick brown fox jumps over the lazy dog"));
}
test "missing the letter 'x'" {
    try testing.expect(!isPangram("a quick movement of the enemy will jeopardize five gunboats"));
}
test "missing the letter 'h'" {
    try testing.expect(!isPangram("five boxing wizards jump quickly at it"));
}
test "with underscores" {
    try testing.expect(isPangram("the_quick_brown_fox_jumps_over_the_lazy_dog"));
}
test "with numbers" {
    try testing.expect(isPangram("the 1 quick brown fox jumps over the 2 lazy dogs"));
}
test "missing letters replaced by numbers" {
    try testing.expect(!isPangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"));
}
test "mixed case and punctuation" {
    try testing.expect(isPangram("\"Five quacking Zephyrs jolt my wax bed.\""));
}
test "a-m and A-M are 26 different characters but not a pangram" {
    try testing.expect(!isPangram("abcdefghijklm ABCDEFGHIJKLM"));
}