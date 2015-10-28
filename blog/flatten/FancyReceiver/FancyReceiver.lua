
local myComplexReader = CONTAINER.READER['MySubscriber::MyComplexReader']

myComplexReader:take()
for  i, sample in ipairs(myComplexReader.samples) do
    if (not myComplexReader.infos[i].valid_data) then
        print("\t invalid data!")
    else
        print("--------------------")
        print("Data from module " .. sample['deviceId'])
        print("\t pressure: " .. sample['pressure'])
        print("\t humidity: " .. sample['humidity'])
        print("\t temperatures: ")
        local avgTmp = 0
        local sum = 0;
        for i=1, sample['temperatures#'] do
            value = sample['temperatures[' .. i .. '].value'];
            sum = sum + value
            print("\t\t sensorId: " .. sample['temperatures[' .. i .. '].sensorId'] .. " value: " .. value)
        end
        avgTmp = sum /  sample['temperatures#']
        print("\t The average temperature is: " .. avgTmp);
    end
end
