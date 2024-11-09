const std = @import("std");
const time = std.time;

fn worker1() void {
    time.sleep(time.ns_per_ms * 2000);
    std.debug.print("worker1 done!\n", .{});
}

fn worker2() void {
    time.sleep(time.ns_per_ms * 1000);
    std.debug.print("worker2 done!\n", .{});
}

pub fn main() !void {
    const thread1 = try std.Thread.spawn(.{}, worker1, .{});
    const thread2 = try std.Thread.spawn(.{}, worker2, .{});
    thread1.join();
    thread2.join();
}
