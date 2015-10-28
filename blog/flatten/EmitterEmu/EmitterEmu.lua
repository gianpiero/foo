
local myComplexWriter  = CONTAINER.WRITER['MyPublisher::MyComplexWriter']
local instance        = myComplexWriter.instance

if count then count = count + 1 else count = 0 end

instance['deviceId'] = 42
instance['humidity'] = 42
instance['pressure'] = 43
instance['temperatures[1].sensorId'] = 1
instance['temperatures[1].value']    = 50
instance['temperatures[2].sensorId'] = 2
instance['temperatures[2].value']    = 48
instance['temperatures[3].sensorId'] = 3
instance['temperatures[3].value']    = 52
instance['temperatures[4].sensorId'] = 4
instance['temperatures[4].value']    = 52
instance['temperatures[5].sensorId'] = 5
instance['temperatures[5].value']    = 48


print(count .. ") writing a sample for deviceId: " .. instance['deviceId'] )
myComplexWriter:write()
