RegisterNetEvent('test_addItem:request', function(key)

    local item = Config.areas[key]
    local name = item.itemGet 
    local total = item.total

    if type(total) == 'table' and #total == 2 then
        if total[1] > total[2] then
            total = {total[2], total[1]}
        end
        total = math.random(total[1], total[2])
    elseif type(total) == 'number' then
        total = total
    end


    print('get ->', name)
    print('total ->', total)
  

end)