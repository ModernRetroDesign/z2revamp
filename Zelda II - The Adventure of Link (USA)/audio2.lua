--7FB
function playMusic(address, value)
  if value == 0 then
    emu.write(0x4105, 0, emu.memType.cpu)
    return value
  elseif emu.read(0x76E, emu.memType.cpu, 2) and value == 1 then
    emu.write(0x4105, 1, emu.memType.cpu)
    return value
  elseif emu.read(0x76E, emu.memType.cpu, 6) and value == 1 then
    emu.write(0x4105, 6, emu.memType.cpu)
    return value
  elseif emu.read(0x76E, emu.memType.cpu, 8) and value == 1 then
    emu.write(0x4105, 8, emu.memType.cpu)
    return value
  elseif emu.read(0x76E, emu.memType.cpu, 2) and value == 2 then
    emu.write(0x4105, 2, emu.memType.cpu)
    return value
  elseif emu.read(0x76E, emu.memType.cpu, 8) and value == 2 then
    emu.write(0x4105, 8, emu.memType.cpu)
    return value
  elseif value == 4 then
    emu.write(0x4105, 4, emu.memType.cpu)
    return value
  elseif value == 6 then
    emu.write(0x4105, 6, emu.memType.cpu)
    return value
  elseif value == 8 then
    emu.write(0x4105, 8, emu.memType.cpu)
    return value
  elseif value == A then
    emu.write(0x4105, 10, emu.memType.cpu)
    return value
  elseif value == 12 then
    emu.write(0x4105, 12, emu.memType.cpu)
    return value
  elseif value == 14 then
    emu.write(0x4105, 14, emu.memType.cpu)
    return value
  elseif value == 16 then
    emu.write(0x4105, 16, emu.memType.cpu)
    return value
  elseif value == 18 then
    emu.write(0x4105, 18, emu.memType.cpu)
    return value
  elseif value == C then
    emu.write(0x4105, 20, emu.memType.cpu)
    return value
end
end


--563 is tile location
function findAlbum(address, value)
  if value == 0 then 
    emu.write(0x4104, 0, emu.memType.cpu)
    return value
  elseif value == 1 then 
    emu.write(0x4104, 1, emu.memType.cpu)
    return value
  elseif value == 2 then 
    emu.write(0x4104, 2, emu.memType.cpu)
    return value
  elseif value == 3 then 
    emu.write(0x4104, 3, emu.memType.cpu)
    return value
  elseif value == 4 then 
    emu.write(0x4104, 4, emu.memType.cpu)
    return value
  elseif value == 5 then 
    emu.write(0x4104, 5, emu.memType.cpu)
    return value
  elseif value == 6 then 
    emu.write(0x4104, 6, emu.memType.cpu)
    return value
  elseif value == 7 then 
    emu.write(0x4104, 7, emu.memType.cpu)
    return value
  elseif value == 8 then 
    emu.write(0x4104, 8, emu.memType.cpu)
    return value
  elseif value == 9 then 
    emu.write(0x4104, 9, emu.memType.cpu)
    return value
end
end


emu.addMemoryCallback(findAlbum, emu.memCallbackType.cpuWrite, 0x563)
emu.addMemoryCallback(playMusic, emu.memCallbackType.cpuWrite, 0x7FB)


--sword_beam_sfx
--function playSFX1(address, value)
--    if value == 1 then
--    emu.write(0x4106, 1, emu.memType.cpu)
--    return value
--end
--end

--emu.addMemoryCallback(playSFX1, emu.memCallbackType.cpuWrite, 0x8D)

--sword_sfx
--function playSFX2(address, value)
--    if value == 2 then
--    emu.write(0x4106, 2, emu.memType.cpu)
--    return value
--end
--end

--emu.addMemoryCallback(playSFX2, emu.memCallbackType.cpuWrite, 0x400)


function pauseMusic(address, value)
  if value == 1 then
    emu.write(0x4101, 1, emu.memType.cpu)
    return value
  elseif value == 0 then
    emu.write(0x4101, 0, emu.memType.cpu)
    return value
end
end
    
emu.addMemoryCallback(pauseMusic, emu.memCallbackType.cpuWrite, 0xEA)

--fixes level up freeze
function levelUp(address, value)
      emu.write(0x74C, 0, emu.memType.cpu)
end
    
emu.addMemoryCallback(levelUp, emu.memCallbackType.cpuWrite, 0x777 , 0x779)

function muteMusic(address, value)
  emu.write(0x7E2, 0, emu.memType.cpu)
    emu.write(0x7E3, 0, emu.memType.cpu)
      emu.write(0x7E4, 0, emu.memType.cpu)
        emu.write(0x7E5, 0, emu.memType.cpu)
          emu.write(0x7E6, 0, emu.memType.cpu)
            emu.write(0x7E7, 0, emu.memType.cpu)
end

emu.addMemoryCallback(muteMusic, emu.memCallbackType.cpuWrite, 0x7E2 , 0x7E7)



--Cannot use this mute method as it messes up the music
--function muteSFX(address, value)
--  emu.write(0xEA, 1, emu.memType.cpu)
--end

--emu.addMemoryCallback(muteSFX, emu.memCallbackType.cpuWrite, 0x7E2 , 0x7E7)

--Can't mute E9 for some reason
--This method also messes up music??
--function muteSFX(address, value)
--  emu.write(0xEC, 0, emu.memType.cpu)
--  emu.write(0xED, 0, emu.memType.cpu)
--  emu.write(0xEE, 0, emu.memType.cpu)
--  emu.write(0xEF, 0, emu.memType.cpu)
--end

--emu.addMemoryCallback(muteSFX, emu.memCallbackType.cpuWrite, 0xEC , 0xEF)


--function paletteSwap(address, value)
--  if value == 4 then
--    emu.write(0x19, 4, emu.memType.palette)
--    emu.write(0x1A, 20, emu.memType.palette)
--    emu.write(0x1B, 36, emu.memType.palette)
--    emu.write(0x1D, 10, emu.memType.palette)
--    emu.write(0x1E, 26, emu.memType.palette)
--    emu.write(0x1F, 42, emu.memType.palette)
--end
--end

--emu.addMemoryCallback(paletteSwap, emu.memCallbackType.cpuWrite, 0x7FB)