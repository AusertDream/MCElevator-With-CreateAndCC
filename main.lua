--https://pastebin.com/xT2S4feR

---@diagnostic disable: undefined-global
--Computer1 is in the elevator
--Computer2 is the main computer to process the msg
--Computer3 can reverse the direction of rotation or not
--Computer4 can control the start of the elevator or not
--Computer5,6,7,8.... is on the floor accordingly
--how many floors you want,how many Computer5,6,7,8...you need
--author Ausert
rednet.open("left")
local CurFloorNum=0 --CurrentFloorNumber plz equal with the real condition or maybe get bug
local DstFloorNum=0 --DestinationFloor inited recommended
while true do 
    local id,msg=rednet.receive("call")
    --process the request when player is in the lift and want to up and down
    --or call the lift and wait
    --the first letter is A means the same function request as Computer1 
    --but Computerid is not Computer1 so we need use A to distinguish
    if(id==1 or string.sub(msg,1,1)=='A') then 
        if(string.sub(msg,1,1)=='A') then 
            msg=string.sub(msg,2)
        end
        DstFloorNum=tonumber(msg)
        if(DstFloorNum<CurFloorNum) then
            rednet.send(3,"1","reverse")
            rednet.send(4,"0","control")
        elseif(DstFloorNum>CurFloorNum) then
            rednet.send(3,"0","reverse")
            rednet.send(4,"0","control")
        end
    --update the Current Floor number of the lift
    else
        CurFloorNum=tonumber(msg)
        if(CurFloorNum==DstFloorNum) then
            rednet.send(4,"1","control")
        end
    end
end