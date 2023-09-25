const std = @import("std");
const print = std.debug.print;
const AutoHashMap = std.AutoHashMap;

pub fn main() void {

    var my_map = AutoHashMap(u8, u8).init(std.heap.page_allocator);
    defer my_map.deinit();

    // try my_map.put('a',1);

    // if (my_map.contains('a') == true) {
    //     print("This map contains char a\n", .{});
    // }

    // if (my_map.contains('b') == false) {
    //     print("This map does not contain char b\n", .{});
    // }

    const str = "isO-gram monogram";

    for (str) |chr| {
        var tmp = chr;
        if (tmp >= 65 and tmp <= 90) {
            tmp = chr + 32;
        }
        if (tmp == '-' or tmp == ' ') {
            print("We have either found - or space\n", .{});
        }

        if (my_map.contains(tmp) == true) {
            print("We have already seen {c}\n", .{tmp});
        } else {
            const x = my_map.put(tmp, 1);
            _ = x catch {};
            print("We have inserted {c}\n", .{tmp});
        }
    }
}