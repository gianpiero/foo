
local mySimpleReader = CONTAINER.READER['MySubscriber::MySimpleReader']

mySimpleReader:take()
for  i, sample in ipairs(mySimpleReader.samples) do
    if (not mySimpleReader.infos[i].valid_data) then
        print("\t invalid data!")
    else
        local deviceId = sample['deviceId']
        local avgTmp   = sample['avgTmp'];
        print("The average temperature on the ISS module is:  " .. avgTmp )
    end
end
