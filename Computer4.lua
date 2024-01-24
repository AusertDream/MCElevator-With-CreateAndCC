--https://pastebin.com/sG16BBBg
---@diagnostic disable: undefined-global
--Computer1 is in the elevator
--Computer2 is the main computer to process the msg
--Computer3 can reverse the direction of rotation or not
--Computer4 can control the start of the elevator or not
--Computer5,6,7,8.... is on the floor accordingly
--how many floors you want,how many Computer5,6,7,8...you need
--author Ausert
rednet.open("left")
while true do
    local id,msg=rednet.receive("control")
    if(msg=="1") then
        redstone.setOutput("back",true)
    else
        redstone.setOutput("back",false)
    end
end