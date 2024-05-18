const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "host",
        .root_source_file = .{ .path = "host/main.zig" },
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });

    lib.force_pic = true;
    lib.disable_stack_probing = true;

    b.installArtifact(lib);
}
