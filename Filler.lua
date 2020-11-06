--Z going positive is south
--X going positive is east
local startX = -916
local startZ = -896
local endX = -885
local endZ = -939
local direction = ""
local refuelSlot = 16
local sandContainerSlot = 15
local sandSlot = 1
local dirtSlot = 13
local dirtContainerSlot = 14

local x, y, z = gps.locate(5)
print(x)
print(y)
print(z)
while x == nil
do
    sleep(5)
    x, y, z = gps.locate(5)
end

local bb, blockBelow = turtle.inspectDown()
function PlaceDirt()
    turtle.select(dirtSlot)
    if turtle.getItemCount() == 0
    then RefillDirt()
    end
    turtle.placeDown()
    turtle.select(sandSlot)
end
function RefillDirt()
    turtle.select(dirtContainerSlot)
    turtle.placeUp()
    turtle.select(dirtSlot)
    turtle.suckUp(64)
    turtle.select(dirtContainerSlot)
    turtle.digUp()
end
function DropSand()
    turtle.select(sandSlot)
    if turtle.getItemCount() == 0
    then RefillSand()
    end
    turtle.select(sandSlot)
    turtle.placeDown()
end

function RefillSand()
    turtle.select(sandContainerSlot)
    turtle.placeUp()
    turtle.select(sandSlot)
    turtle.suckUp(64)
    turtle.select(sandContainerSlot)
    turtle.digUp()
end
function Refuel()
    turtle.select(refuelSlot)
    turtle.refuel(1)
end

function MoveForward()
    while turtle.inspect()
    do turtle.dig()
    end
    turtle.forward()
end

function GetPosition()
    x, y, z = gps.locate(5)
end

function GetDirection()

end

while endX >x do
    if endZ > z
    then
        print(endZ)
        print(z)
        turtle.turnRight()
        MoveForward()
        turtle.turnRight()
        MoveForward()
    end

    if startZ < z
    then
        turtle.turnLeft()
        MoveForward()
        turtle.turnLeft()
        MoveForward()
    end

    if turtle.getFuelLevel() == 0 
    then Refuel()
    end

    bb, blockBelow = turtle.inspectDown()
    if bb==false
    then 
        PlaceDirt()
        MoveForward()
    else
        if blockBelow.name == "minecraft:water"
        then DropSand()
        elseif blockBelow.name == "minecraft:tall_seagrass"
        then 
            turtle.digDown()
            DropSand()
        else 
            print(blockBelow.name)
            MoveForward()
        end
    end
    x, y, z = gps.locate(5)
end