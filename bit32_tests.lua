--[=[ Basic tests

  Mostly just the assertions from the reference manual
  (http://www.lua.org/manual/5.2/manual.html#6.7)

]=]

bit32 = require('bit32')

test = function(fun) io.write(fun .. '() ... '):flush() end
ok = function() print 'PASS' end

MAX_32 = 0xFFFFFFFF
function toint(x) return tonumber(x) // 1 | 0 end
function to32 (x) return toint(x % (2^32)) end


do test 'arshift'
  assert(bit32.arshift(-1, 32) == MAX_32)
  assert(bit32.arshift(-1, -32) == 0)
  assert(bit32.arshift(1, 32) == 0)
  assert(bit32.arshift(1, -32) == 0)
  assert(bit32.arshift(-8, 2) == to32(-2))
ok() end

do test 'bnot'
  assert (bit32.bnot(0) == 0xFFFFFFFF)
  local x = 666
  assert(bit32.bnot(x) == (-1 - x) % 2^32)
ok() end

do test 'lrotate'
  local x = 666
  for disp = -33, 33 do
     assert(bit32.lrotate(x, disp) == bit32.lrotate(x, disp % 32))
  end
ok() end

do test 'lshift'
  local b = 666
  for disp = 1, 33 do
    assert(bit32.lshift(b, disp) == (b * 2^disp) % 2^32)
  end
ok() end

do test 'rrotate'
  local x = 666
  for disp = -33, 33 do
     assert(bit32.rrotate(x, disp) == bit32.rrotate(x, disp % 32))
  end
ok() end

do test 'rshift'
  local b = 666
  for disp = 1, 33 do
    assert(bit32.rshift(b, disp) == math.floor(b % 2^32 / 2^disp))
  end
ok() end

