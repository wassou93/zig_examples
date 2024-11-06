const std = @import("std");

pub fn main() !void {
    var counter: u8 = 0;
    const size = maxDigitsForType(@TypeOf(counter));
    var buffer: [size]u8 = undefined;
    while (counter < 2) : (counter += 1) {
        try println(intToStr(&buffer, counter));
        try println("\n");
    }
    try println("Press Enter to continue...");
    var dbgBuf: [1]u8 = undefined;
    _ = try std.io.getStdIn().read(&dbgBuf);
}

fn println(str: []const u8) !void {
    const stdout = std.io.getStdOut().writer();
    // try std.fmt.format(stdout, "{s}\n", .{str});
    // this is using format inside
    try stdout.print("{s}", .{str});
}

/// Calculate the number of digits required for a given integer type
fn maxDigitsForType(comptime T: type) comptime_int {
    return std.math.log10(std.math.maxInt(T)) + 1;
}

pub fn intToStr(buffer: []u8, n: usize) []const u8 {
    // NOTE: If you want to make the buffer c-compatible you could use bufPrintZ instead
    const result = std.fmt.bufPrintZ(buffer[0..], "{d}", .{n}) catch unreachable;
    return @as([]const u8, result);
}

//
