# lua54-bit32
Reimplementation of Lua 5.2's bit32 library in pure Lua 5.4

The main reason for writing this code was the fact that I couldn't find out if
someone has already written a full drop-in compatibility module for the old
(and finally removed) `bit32`.

For most situations, it seems to be a bad idea to use this module instead of
changing code to use the 64-bit bitwise operators of Lua 5.4.

## Description
This library aims to exactly imitate the `bit32` standard library of Lua 5.2
for newer Lua versions in pure Lua code.  Thus the `bit32.lua` module in the
repository aims to exactly reimplement the behaviour described  in the  _Lua
5.2 Reference Manual_, accessible at http://www.lua.org/manual/5.2/manual.html .

Particular care was taken to coerce inputs and return values to 32-bit wide integers.
According to the [5.2 Manual]( http://www.lua.org/manual/5.2/manual.html#6.7):

> Unless otherwise stated, all functions accept numeric arguments in the
> range (`-2^51`,`+2^51`); each argument is normalized to the remainder of
> its division by `2^32` and truncated to an integer (in some unspecified
> way), so that its final value falls in the range `[0,2^32 - 1]`.
> Similarly, all results are in the range [0,2^32 - 1]. Note that
> `bit32.bnot(0)` is `0xFFFFFFFF`, which is different from `-1`.
