

local closestZoneName = nil

-- Create Object
CreateThread(function()
    for _, area in ipairs(Config.areas) do
        local object = Modules.createObject(area.model, vector3(area.x, area.y, area.z), false, true, true, true)
        area.object = object
        Functions.createdObjectZone(area.name, object)
    end
end)

-- Thread for check distance
CreateThread(function()
    while true do
        Wait(0)
        for _, area in ipairs(Config.areas) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local shopCoords = vector3(area.x, area.y, area.z)
            local distance = #(playerCoords - shopCoords)
            if distance < area.radius and IsControlJustPressed(0, 38) then
                if Functions.willOpenArea(area) then
                    print(area.name)
                end
            end
        end
    end
end)



-- Clear when stop
AddEventHandler('onResourceStop', function(resourceName)

    if resourceName ~= GetCurrentResourceName() then
        return
    end

    -- Clear Object
    for _, area in ipairs(Config.areas) do
        if DoesEntityExist(area.object) then
            DeleteEntity(area.object)
        end
    end

end)