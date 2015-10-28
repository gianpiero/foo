
local myComplexReader = CONTAINER.READER['MySubscriber::MyComplexReader']
local mySimpleWriter  = CONTAINER.WRITER['MyPublisher::MySimpleWriter']
local instance        = mySimpleWriter.instance

myComplexReader:take()
for  i, sample in ipairs(myComplexReader.samples) do
    if (not myComplexReader.infos[i].valid_data) then
        print("\t invalid data!")
    else
        local deviceId = sample['deviceId']
        local avgTmp = 0
        local sum = 0;
        for i=1, sample['temperatures#'] do
            sum = sum + sample['temperatures[' .. i .. '].value'];
        end
        avgTmp = sum /  sample['temperatures#']

        --setting the instance
        instance['deviceId'] = deviceId
        instance['avgTmp']   = avgTmp
        -- writing the simple instance
        print("Writing a simple sample with avgTmp = " .. instance['avgTmp'] )
        mySimpleWriter:write()
    end
end
