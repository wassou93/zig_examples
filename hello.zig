const std = @import("std");

pub fn main() !void {
    var age: u64 = 128;
    var pAge: *u64 = &age;

    std.debug.print("pAge: {p}\n", .{pAge});

    pAge = @ptrFromInt(@intFromPtr(pAge) + 1 * @sizeOf(u64));

    std.debug.print("pAge incremented by 8: {p}\n", .{pAge});

    var pVoid: *void = @ptrCast(pAge);

    std.debug.print("pVoid: {p}\n", .{pVoid});

    pVoid = @ptrFromInt(@intFromPtr(pVoid) + 1);

    std.debug.print("pVoid incremented by 1: {p}\n", .{pVoid});
}
