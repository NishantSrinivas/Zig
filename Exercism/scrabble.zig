const print = @import("std").debug.print;

pub fn main() void {
    const word = "sfjower";
    const scr = score(word);

    print("the score = {d}\n", .{scr});
}

pub fn score(s: []const u8) u32 {
    var res: u32 = 0;

    for (s) |c| {
        var chr = c;
        if (chr >= 97 and chr <= 122) {
            chr = 65 + ((chr - 97) % 26);
        }
        
        if (chr == 'A' or chr == 'E' or chr == 'I' or chr == 'O' or chr == 'U' or chr == 'L' or chr == 'N' or chr == 'R' or chr == 'S' or chr == 'T') {
            res += 1;
        }
        else if (chr == 'D' or chr == 'G') {
            res += 2;
        }
        else if (chr == 'B' or chr == 'C' or chr == 'M' or chr == 'P') {
            res += 3;
        }
        else if (chr == 'F' or chr == 'H' or chr == 'V' or chr == 'W' or chr == 'Y') {
            res += 4;
        }
        else if (chr == 'K') {
            res += 5;
        }
        else if (chr == 'J' or chr == 'X') {
            res += 8;
        }
        else if (chr == 'Q' or chr == 'Z') {
            res += 10;
        }
    }

    return res;
}
