--Azul
--By DocStive
 
 
endOfTheBag = false
mainBagGUID = '386f14'
mainBag = {}
trashArrayGUID = {'301899', '7d525e', 'b92e49', '52046f'}
trash1 = {}
trash2 = {}
trash3 = {}
trash4 = {}
trashArray = {}
 
numberOfPlayers = 2
btnNewRound = {}
btn2p = {}
btn3p = {}
btn4p = {}
btnGray = {}
btnJoker = {}
lockDoubleTrouble = true
gameStarted = false
widthsize = 5200
heightsize = 1200
fontsize = 800
 
 
inspector = false
gray = false
 
playerPosBland = {{-24.98, 0.96, -14.78}
,{-37.22, 0.96, 14.75}
,{24.98, 0.96, 14.76},
{37.27, 0.96, -14.80}
}
 
playerRotBland = {{0.00, 359.98, 0.00}
,{0.00, 179.98, 0.00}
,{0.00, 359.99, 0.00}
,{0.00, 179.98, 0.00}
}
 
factoryLoops = 5
factoryLocationArray =  {
{ {-13.95, 0.96, -4.24} , {-10.86, 0.96, -4.27} , {-13.94, 0.96, -7.33} , {-10.83, 0.96, -7.35} },
{ {-11.96, 0.96, -15.05} , {-8.87, 0.96, -15.08} , {-11.94, 0.96, -18.14} , {-8.84, 0.96, -18.16} },
{ {-1.55, 0.96, -18.18} , {1.53, 0.96, -18.22} , {-1.54, 0.96, -21.28} , {1.56, 0.96, -21.30} },
{ {8.81, 0.96, -15.04} , {11.90, 0.96, -15.08} , {8.82, 0.96, -18.14} , {11.92, 0.96, -18.16} },
{ {10.79, 0.96, -4.21} , {13.88, 0.96, -4.25} , {10.81, 0.96, -7.30} , {13.91, 0.96, -7.32} },
{ {-14.00, 0.96, 13.74} , {-10.91, 0.96, 13.71} ,{-13.98, 0.96, 10.65}  , {-10.88, 0.96, 10.63} },
{ {10.82, 0.96, 13.75} , {13.91, 0.96, 13.72} , {10.84, 0.96, 10.66} , {13.94, 0.96, 10.64} },
{ {-7.54, 0.96, 21.36} ,{-4.45, 0.96, 21.32}  , {-7.53, 0.96, 18.27} , {-4.43, 0.96, 18.25} },
{ {4.50, 0.96, 21.34} , {7.59, 0.96, 21.31} ,{4.52, 0.96, 18.25}  , {7.62, 0.96, 18.23} }
}
 
function onSave()
    local saveMeGod = {}
    saveMeGod.gameStarted = gameStarted
    saveMeGod.factoryLoops = factoryLoops
    return JSON.encode(saveMeGod)
end
 
 
function  ChangeButtonText(target, newtext)
    local button_parameters = {}
    button_parameters.index = 0
    button_parameters.label = newtext
    target.editButton( button_parameters )
end
 
 
function jokertoggle()
 
if(inspector)
then
    ChangeButtonText(btnJoker,'Joker Exp   [ ]')
    inspector = false
else
    ChangeButtonText(btnJoker,'Joker Exp   [✔]')
    inspector = true
 
end
 
 
end
 
function graytoggle()
 
if(gray)
then
    ChangeButtonText(btnGray,'Gray boards [ ]')
    gray = false
else
    ChangeButtonText(btnGray,'Gray boards [✔]')
    gray = true
 
end
 
 
end
 
function onLoad(saveMeGod)
 
saveMeGod = JSON.decode(saveMeGod)
    if(saveMeGod and saveMeGod.gameStarted)
    then
        gameStarted = saveMeGod.gameStarted
        factoryLoops = saveMeGod.factoryLoops
       
    else
        btn2p = CreateMaButton('b1decc','Setup for 2 Players','setup2p',200,3000)
        btn3p = CreateMaButton('081ae6','Setup for 3 Players','setup3p',200,3000)
        btn4p = CreateMaButton('f30e5b','Setup for 4 Players','setup4p',200,3000)
        btnJoker = CreateMaButton('561447','Joker Exp   [ ]','jokertoggle',200,3000)
        btnGray = CreateMaButton('c321c0', 'Gray boards [ ]','graytoggle',200,3000)
   
       
    end
 
mainBag = getObjectFromGUID(mainBagGUID)
mainBag.shuffle()
mainBag.shuffle()
mainBag.shuffle()
trash1 =  getObjectFromGUID(trashArrayGUID[1])
trash2 =  getObjectFromGUID(trashArrayGUID[2])
trash3 =  getObjectFromGUID(trashArrayGUID[3])
trash4 =  getObjectFromGUID(trashArrayGUID[4])
trashArray = {trash1,trash2, trash3, trash4}
if(gameStarted)
then
setGame()
end
end
 
function CreateMaButton(guidBoy, name, method, plusH, plusW)
--print(guidBoy)
    local button = getObjectFromGUID(guidBoy)
    local button_parameters = {}
    button_parameters.click_function = method
    button_parameters.label = name
    button_parameters.function_owner = nil
    button_parameters.position = {0, 0.2, 0}
    button_parameters.rotation = {0, 180, 0}
    button_parameters.width = widthsize + plusW
    button_parameters.height = heightsize + plusH
    button_parameters.font_size = fontsize
    button.createButton(button_parameters)
    return button
end
 
 
function cover3p()
    local tile = getObjectFromGUID('c4811d')
    tile.setPosition({-12.37, 0.85, 12.23})
 
    object.interactable = false
   
end
 
 
 
function setup2p()
   
local tile2 = getObjectFromGUID('c4811d')
tile2.interactable = false
local tile3 = getObjectFromGUID('497986')
tile3.interactable = false
local tile4 = getObjectFromGUID('9ab0f9')
tile4.interactable = false
local tile5 = getObjectFromGUID('537a4c')
tile5.interactable = false
   
   
   
   
   
destroyButtons()
setGame()
end
 
function setup3p()
numberOfPlayers = 3
factoryLoops = 7
destroyObject(getObjectFromGUID('c4811d'))
destroyObject(getObjectFromGUID('497986'))
 
destroyButtons()
setGame()
end
 
 
function setup4p()
numberOfPlayers = 4
 factoryLoops = 9
destroyObject(getObjectFromGUID('c4811d'))
destroyObject(getObjectFromGUID('497986'))
 
 
destroyObject(getObjectFromGUID('9ab0f9'))
destroyObject(getObjectFromGUID('537a4c'))
 
 
destroyButtons()
setGame()
end
 
 
 
function destroyButtons()
    destroyObject(btn2p)
    destroyObject(btn3p)
    destroyObject(btn4p)
    destroyObject(btnJoker)
    destroyObject(btnGray)
   
 
end
 
 
function setupThingsPos(arrayPos, arrayRot, targetBag, lock)
    --targetBag = getStuffFromZone(bagZone)
   
    targetBag.shuffle()
    local amount = #arrayPos
    for i = 1, amount do
        local pos = {}
        pos.position = arrayPos[i]
        if(arrayRot ~= nil)
        then
            pos.rotation= arrayRot[i]
        else
           
            pos.rotation= {0.00, 270.00, 0.00}
        end
        local token = targetBag.takeObject(pos)
        if(lock)
        then
            token.setLock(true)
        end
    end
end
 
 
function setGame()
gameStarted = true
btnNewRound = CreateMaButton('8d8701','Setup New Round','setupNewRoundy',200,1000)
if (gray)  then
    grayayay = getObjectFromGUID('a77cce')
    setupThingsPos(playerPosBland, playerRotBland, grayayay, true)
end
 
looops = 10
local swapbag = getObjectFromGUID('c8782d')
mainBag = getObjectFromGUID(mainBagGUID)
if(numberOfPlayers == 2) then
    looops = 5
    for i=1,looops do
        local paramss = {}
        mainBag.putObject(swapbag.takeObject(paramss))
    end
end
 
if (inspector) then
   
    jokerbag = getObjectFromGUID('019bb3')
   
    for i = 1, looops do
        local paramss = {}
       
        local token12 = jokerbag.takeObject(paramss)
 
        mainBag.putObject(token12)
    end
else
    for i=1,looops do
        local paramss = {}
        mainBag.putObject(swapbag.takeObject(paramss))
    end
   
end
 
 
mainBag.shuffle()
 
 
end
 
 
function setupNewRoundy()
    if(lockDoubleTrouble)
then
 
    setupFactory()
    lockDoubleTrouble= false
    startLuaCoroutine(Global, 'waitForUnlock' )
    end
end
 
 
function refillFactoryBag()
    if(mainBag.getQuantity() == 0)
    then
        for i = 1, 4 do
            if(trashArray[i].getQuantity() > 0)
            then
                local amountofthings = trashArray[i].getQuantity()
                local params = {}
                for j = 1, amountofthings do   
                    mainBag.putObject(trashArray[i].takeObject(params))
                end
            end
        end
        mainBag.shuffle()
    end
end
 
 
function setupFactory(factoryArrayIndex)
    local moveStartPlayer = getObjectFromGUID('494623')
    local posing = {0.00, 0.96, 0.00}
    if(moveStartPlayer == nil) then
        local paramssss = {}
        paramssss.guid = '494623'
        paramssss.position = posing
        for i = 1, #trashArray do
            objots = trashArray[i].getObjects()
            exists = false
 
            for z, player in ipairs(objots) do
 
                if(player.guid == paramssss.guid)
                then
                    exists = true
                end
            end
            if(exists) then
                exists = false
                trashArray[i].takeObject(paramssss)
            end
           
        end
    else
        moveStartPlayer.setPosition(posing)
    end
   
   
    for i = 1, factoryLoops do
        for k = 1, 4 do
            refillFactoryBag()
            local pos = {}
            pos.position = factoryLocationArray[i][k]
            pos.rotation= {0.00, 180.00, 0.00}
            if(mainBag.getQuantity() > 0)
            then
                mainBag.takeObject(pos)
            else
                endOfTheBag = true
            end
        end
    end
    if(endOfTheBag)
    then
        broadcastToAll('The tile bag emptied and there is no more discarded tiles from previous round in any trash bin, some factories may have less tiles than possible.',{r = 1, g = 1, b = 1})
    end
end
 
function waitForUnlock()
waitone()
waitone()
waitone()
lockDoubleTrouble = true
 
return true
end
 
function waitone()
local Time = os.clock() + 1
        while os.clock() < Time do
          coroutine.yield(0)
        end
end
