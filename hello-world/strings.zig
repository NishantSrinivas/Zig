const print = @import("std").debug.print;

pub fn main() void {
    const my_string = "This is my string!";

    // Let's print the string as it is
    print("my string = {s}\n", .{my_string});

    // What if try to index it?
    print("first char = {c}\n", .{my_string[0]});

    // Can we loop through it?
    for (my_string) |chr| {
        print("char = {c}\n", .{chr});
    }

    // Can we create variable strings?
    var var_string = "variable string";

    print("This is a {s}\n", .{var_string});

    // Strings are immutable
    // var_string[10] = 'b';
    // print("This is a {s} now\n", .{var_string});

    var var_str = [_]u8{'H','e','l','l','o','\n'};
    print("{s}", .{var_str});

    var_str[0] = 'M';
    print("{s}", .{var_str});
}