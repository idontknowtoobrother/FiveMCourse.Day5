Functions = {}



-- ฟังก์ชันนี้ทำงานเมื่อสร้าง Object ของโซนนั้นๆแล้ว
-- name : string ชื่อของโซน
Functions.createdObjectZone = function(name, object)

    print('^3Created Object Zone : ^2' .. name .. '^0')
end


-- ฟังก์ชันนี้ทำงานเมื่อผู้เล่นกด E ในโซนนั้นๆ
-- area ค่าตาม Config.areas ในแต่ละโซน
Functions.willOpenArea = function(area) 

    print('^3Opening Area : ^2' .. area.name .. '^0')

    if area.jobs == nil then
        Functions.playAnimationObject(area.object) 
        return true
    end

    local playerJobName = ESX.GetPlayerData().job.name
    for _, job in ipairs(area.jobs) do
        if playerJobName == job then
            Functions.playAnimationObject(area.object) 
            return true
        end
    end
    
    return false
end


Functions.requestParticle = function(dict, name)

    
    RequestNamedPtfxAsset(dict)
    while not HasNamedPtfxAssetLoaded(dict) do
        Citizen.Wait(0)
    end
    

end

Functions.playAnimationObject = function(object)

    local objectLoc = GetEntityCoords(object)
    local rotation = 360.0
    local lastHeight = objectLoc.z
    local height = objectLoc.z

    local dict = "scr_indep_fireworks"
    local particleName = "scr_indep_firework_shotburst"

    Functions.requestParticle(dict, particleName)

    CreateThread(function()
        while rotation > 0 do
            Wait(0)
            rotation = rotation - 8.0
            height = height - 0.006
            SetEntityHeading(object, rotation)
            SetEntityCoords(object, objectLoc.x, objectLoc.y, height)
        end
    
        while height < lastHeight do
            Wait(0)
            rotation = rotation + 8.0
            height = height + 0.006
            SetEntityHeading(object, rotation)
            SetEntityCoords(object, objectLoc.x, objectLoc.y, height)
            UseParticleFxAssetNextCall(dict)
            StartParticleFxNonLoopedAtCoord(particleName, objectLoc.x, objectLoc.y, objectLoc.z, 0.0, 0.0, 0.0, 0.1, false, false, false)
        end
    end)

end