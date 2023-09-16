const print = @import("std").debug.print;

pub fn main() void {
    const num: usize = 125;
    const result: usize = steps(num);

    print("The result = {d}\n", .{result});
}

pub fn steps(number: usize) usize {
    var inp: usize = number;
    var count: usize = 0;
    while (inp != 1) : (count += 1) {
        if (inp % 2 == 0) {
            inp /= 2;
        } else {
            inp = (inp * 3) + 1;
        }
    }

    return count;
}