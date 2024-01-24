--https://pastebin.com/Y4sVEzEx
---@diagnostic disable: undefined-global
--Computer1 is in the elevator
--Computer2 is the main computer to process the msg
--Computer3 can reverse the direction of rotation or not
--Computer4 can control the start of the elevator or not
--Computer5,6,7,8.... is on the floor accordingly
--how many floors you want,how many Computer5,6,7,8...you need
--author Ausert
rednet.open("bottom")
local CurrentFloor=0 
--CurrentFloor means which floor is this computer on
--in use you should change the <CurrentFloor> to floor number accordingly
redstone.setOutput("right",false)
while true do
    sleep(0.02)
    local res1 = redstone.getInput("back")
    local res2 = redstone.getInput("left")
    if(res1) then 
        redstone.setOutput("right",true)
        rednet.send(2,"<CurrentFloor>","call")
        sleep(0.1)
        redstone.setOutput("right",false)
    end
    if(res2) then
        rednet.send(2,"A<CurrentFloor>","call")
    end
end