--Z going positive is south
--X going positive is east
local startX = -998
local startZ = -804
local endX = -979
local endZ = -824
local refuelSlot = 16
local witherSlot = 1

local x, y, z = gps.locate(5)



function Explode()
    turtle.select(witherSlot)
    sleep(0.1)
    turtle.placeUp()
    sleep(0.1)
    turtle.back()
    sleep(0.1)
    turtle.up()

    local counter = 0
    while counter < 10 do
        redstone.setOutput("front", not redstone.getOutput("front"))
        sleep(0.3)
        counter = counter + 1
    end

    turtle.down()
    sleep(0.1)
    MoveForward()

end

function Refuel()
    turtle.select(refuelSlot)
    turtle.refuel(1)
end
function MoveForward()
    turtle.select(1)
    while turtle.inspect()
    do 
        turtle.dig()
        sleep(0.1)
    end
    turtle.digUp()
    sleep(0.1)
    turtle.forward()
end
function GetPosition()
    x, y, z = gps.locate(5)
end


while endX >x do
    
    if turtle.getFuelLevel() == 0 
    then Refuel()
    end

    if endZ > z
    then
        print(endZ)
        print(z)
        turtle.turnRight()
        MoveForward()
        MoveForward()
        turtle.turnRight()
        MoveForward()
    end

    if startZ < z
    then
        print("TOO FAR SOUTH?")
        print(startZ)
        print(z)
        turtle.turnLeft()
        MoveForward()
        MoveForward()
        turtle.turnLeft()
        MoveForward()
    end

    Explode()
    MoveForward()
    MoveForward()

    
    x, y, z = gps.locate(5)
end