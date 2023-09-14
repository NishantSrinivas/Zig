const print = @import("std").debug.print;

pub fn main() void {
    print("We are going to do pointers!!\n",.{});

    // Dereferncing = var.*
    // Referncing = &var

    var some_num: u8 = 100;
    var my_ptr: *u8 = &some_num;

    // Let's try to print it
    print("num = {d}\n", .{my_ptr.*});

    // Let's try to modify it
    my_ptr.* += 30;

    // now let's check some_num
    print("some_num = {d}\n", .{some_num});

    mod_number(my_ptr);
    print("some_num = {d}\n", .{some_num});

    var numbers = [10]u8{1,2,3,4,5,6,7,8,9,10};
    var ptr_nums: *[10]u8 = &numbers;

    print("numbers[0] = {d}\n", .{ptr_nums.*[0]});
    print("numbers[1] = {d}\n", .{ptr_nums.*[1]});

    print_numbers(numbers[0..5]);

}

fn mod_number(n: *u8) void {
    n.* -= 20;
}

fn print_numbers(slc: []const u8) void {
    for (slc) |num| {
        print("number = {d}\n", .{num});
    }
}

