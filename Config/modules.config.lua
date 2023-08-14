Modules = {}

Modules.loadModel = function(model)

    local model = type(model) == 'number' and model or GetHashKey(model)
    local attempt = 0

    if not HasModelLoaded(model) and IsModelInCdimage(model) then
        RequestModel(model)
        while not HasModelLoaded(model) and attempt < 100 do
            Wait(1)
            attempt = attempt  + 1 
        end
    end

end

Modules.createObject = function(model, coords, isNetwork, freeze, placeOnGround, invincible)

    Modules.loadModel(model)

    local object = CreateObject(model, coords.x, coords.y, coords.z, isNetwork, true)

    if placeOnGround then
        PlaceObjectOnGroundProperly(object)
    end

    if freeze then
        FreezeEntityPosition(object, true)
    end

    if invincible then
        SetEntityInvincible(object, true)
    end

    return object
end