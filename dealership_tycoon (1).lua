local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'FireServer' and self.Name == "JobRemoteHandler" and rawget(...,"Action") == "StartDeliveryJob" then
print(Args)
 _G.remotetable = ...
    end
	return namecall(self, ...) 
end)
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/ui%20libs2", true))()
local example = library:CreateWindow({
  text = "Vehicle Dealership"
})
example:AddToggle("Auto Extinguish Fire", function(state)
    getfenv().fireman = (state and true or false)
    workspace.Gravity = 196
    while getfenv().fireman do
        wait()
        workspace.Gravity = 196
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
        if not game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool") and not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
        game:GetService("ReplicatedStorage").Remotes.Switch:FireServer("FireDealership")
        wait(10)
        elseif game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool"))
            wait(1)
        elseif game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("FireGuide") then
        local test = nil
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "FirePart" then
            test = v
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame 
            end
        end
    if test == nil then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Players").LocalPlayer.PlayerGui.FireGuide.Adornee.CFrame
    elseif test ~= nil then
        pcall(function()
          for i,v in pairs(test.Parent:GetDescendants()) do
            if v.ClassName == "Part" and v.CanCollide == true or  v.ClassName == "MeshPart" and v.CanCollide == true then
                v.CanCollide = false
            end
        end
        workspace.Gravity = 0
        repeat task.wait()
        game:GetService("ReplicatedStorage").Remotes.TaskController.ActionGameDataReplication:FireServer("TryInteractWithItem", {["GameName"] = "FirefighterGame",["Action"] = "UpdatePlayerToolState",["Data"] = {["IsActive"] = true,["ToolName"] = "Extinguisher"}})
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=test.CFrame*CFrame.new(0,10,0)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.Angles(math.rad(-90),0,0)
        until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("FireGuide")
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
    end)
        end
    end
    end
    end
    end)
    example:AddToggle("Auto Find Extinguishers", function(state)
        getfenv().autoextfind = (state and true or false)
        while getfenv().autoextfind do
            task.wait()
        for i,v in pairs(workspace:GetChildren()) do
            if v.Name == "Model" and v:FindFirstChild("FireExt") and v:FindFirstChild("FireExt").Transparency == 0 or v.ClassName == "Model" and #v:GetChildren() == 0 then
                local timeout = 0
                repeat task.wait()
                    timeout = timeout + 1
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =v.WorldPivot
                until #v:GetChildren() > 0  or timeout > 10 or getfenv().autoextfind == false
                if v:FindFirstChild("FireExt") then
                    repeat task.wait()
        game:GetService("ReplicatedStorage").Remotes.Collectibles.TryToCollect:FireServer(v.Part)
                    until v:FindFirstChild("FireExt").Transparency == 1 or getfenv().autoextfind == false
                end
                print(v)
            end
        end
    end
    end)
example:AddToggle("Auto Farm", function(state)
getfenv().auto = (state and true or false)
while getfenv().auto do
workspace.Gravity = 0
local chr = game.Players.LocalPlayer.Character
local car = chr.Humanoid.SeatPart.Parent.Parent
dist = (chr.HumanoidRootPart.Position-car.Engine.CFrame.LookVector*1000).Magnitude
local TweenService = game:GetService("TweenService")
local TweenInfoToUse = TweenInfo.new(dist/1000, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, true, 0)

local TweenValue = Instance.new("CFrameValue")
TweenValue.Value = car:GetPrimaryPartCFrame()
        
TweenValue.Changed:Connect(function()
car:SetPrimaryPartCFrame(TweenValue.Value)
end)
local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=car.Engine.CFrame+car.Engine.CFrame.LookVector*1000})
OnTween:Play()
OnTween.Completed:Wait()
workspace.Gravity = 196
end
end)

example:AddToggle("Auto Sell Cars",function(state)
    getfenv().Customer = (state and true or false)
    while getfenv().Customer do
        task.wait()
    pcall(function()
        local function plot()
            for i,v in pairs(workspace.Tycoons:GetDescendants()) do
            if v.Name == "Owner" and v.ClassName == "StringValue" and string.find(v.Parent.Name,"Plot") and v.Value == game.Players.LocalPlayer.Name or v.Name == "Owner" and v.ClassName == "StringValue" and string.find(v.Parent.Name,"Slot") and v.Value == game.Players.LocalPlayer.Name then
            tycoon = v.Parent
            end
            end
            return tycoon
            end
    _G.rat = nil
local customer
    for i,v in pairs(plot().Dealership:GetChildren()) do
        if v.ClassName == "Model" and v.PrimaryPart ~= nil and  v.PrimaryPart.Name == "HumanoidRootPart" then
            customer = v
        end
    end
    local text = customer:GetAttribute("OrderSpecBudget"):split(";")
    local num = tonumber(text[2])
    local plr = game.Players.LocalPlayer
    local guis = plr.PlayerGui
    local menu = guis.Menu
    local req = guis.Dialogue.CarSpec.Frame.Frame
    for i,v in pairs(menu.Shop.Cars.Frame.Frame:GetDescendants()) do
        if v.Name == "PriceValue" and tonumber(string.gsub(v.Value,",",""):split("$")[2]) > tonumber(text[1]) and tonumber(string.gsub(v.Value,",",""):split("$")[2]) < tonumber(text[2]) then
    local ok =tonumber(string.gsub(v.Value,",",""):split("$")[2])
    if ok < num then
    num = ok
    _G.rat = v
    end
    end
    end
    textn = 1
repeat wait()
text = _G.rat.Parent.Name:split("")[textn]
    textn=textn+1

    warn(text,textn)
until tonumber(text) == nil
    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler:FireServer({["Action"] = "AcceptOrder",["OrderId"] = customer:GetAttribute("OrderId")})
    wait()
    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler:FireServer({["Specs"] = {["Springs"] = customer:GetAttribute("OrderSpecSprings"),["Color"] = customer:GetAttribute("OrderSpecColor"),["Rims"] = customer:GetAttribute("OrderSpecRims"),["Car"] = text.._G.rat.Parent.Name:split(tostring(_G.rat.Parent.Name:split("")[textn-1]))[2],["RimColor"] = customer:GetAttribute("OrderSpecRimColor")},["Action"] = "CompleteOrder",["OrderId"] = customer:GetAttribute("OrderId")})
    wait()
    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler:FireServer({["Action"] = "CollectReward",["OrderId"] = customer:GetAttribute("OrderId")})
    repeat wait()
    until customer.Parent == nil or  getfenv().Customer == false
    wait(5)
    end)
    end
end)
example:AddToggle("Auto Delivery",function(state)
    getfenv().deliver = (state and true or false)
    resetcharactervalue1=0
    devpart2 = 1
    spawn(function()
        while getfenv().deliver do
            task.wait()
            pcall(function()
        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
            wait(5)
            getfenv().spawned = false
        end
        end)
        end
        end)
        spawn(function()
            while getfenv().deliver do
                task.wait()
           if devpart2 ~= nil then
            print(resetcharactervalue1)
            resetcharactervalue1=0
            elseif devpart2 == nil and resetcharactervalue1 >= 20 then
                resetcharactervalue1=0
                game.Players.LocalPlayer.Character:BreakJoints()
wait(1)
            end
        end
                end)
    while getfenv().deliver do
        wait()
        pcall(function()
    if game.Players.LocalPlayer.Character.Humanoid.SeatPart ~= nil then
        task.wait(1)
        devpart2 = nil
    for i,v in pairs(workspace.ActionTasksGames.Jobs:GetDescendants()) do
    if v.Name == "DeliveryPart" and v.Transparency ~= 1 then
        devpart2 =v
        workspace.Gravity = 0
        getfenv().spawned = false
        game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame)
        game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame*CFrame.new(-30,20,-10))
        game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame*CFrame.Angles(0,math.rad(90),0))
       for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:GetChildren()) do
        if v.ClassName == "Model" and v:GetAttribute("StockTurbo") then
            for a,b in pairs(workspace.ActionTasksGames.Jobs:GetChildren()) do
                if b.ClassName == "Model" and b:GetAttribute("JobId") then
            game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["Action"] = "TryToCompleteJob",["JobId"] = b:GetAttribute("JobId")})
            game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["JobId"] = game:GetService("Players").LocalPlayer.PlayerGui.MissionRewardStars:GetAttribute("JobId"),["Action"] = "CollectReward"})
        end
    end
        end 
    end
end
    end
    if devpart2 == nil then
        resetcharactervalue1=resetcharactervalue1+1
    end
    elseif game.Players.LocalPlayer.Character.Humanoid.Sit == false and getfenv().spawned ~= true then
        game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer(_G.remotetable)
        workspace.Gravity = 196
        getfenv().spawned = true
    wait(0.1)
    end
    end)
    end
end)
example:AddToggle("Auto Upgrade Plot",function(state)
    getfenv().buyer = (state and true or false )
while getfenv().buyer do
task.wait()
-- purchase buttons
local function plot()
    for i,v in pairs(workspace.Tycoons:GetDescendants()) do
    if v.Name == "Owner" and v.ClassName == "StringValue" and v.Value == game.Players.LocalPlayer.Name then
    tycoon = v.Parent
    end
    end
    return tycoon
    end
    -- purchase buttons
    pcall(function()
    for i,v in pairs(plot().Dealership.Purchases:GetChildren()) do 
        if getfenv().buyer == true and v.TycoonButton.Button.Transparency == 0 then
    game:GetService("ReplicatedStorage").Remotes.Build:FireServer("BuyItem", v.Name)
    wait(0.3)
    end 
end   
end)
end
end)
example:AddToggle("Annoying Popup Disabler",function(state)
    getfenv().annoy = (state and true or false )
if getfenv().annoy == true then
-- annoying popup remover
getfenv().fun =game:GetService("Players").LocalPlayer.PlayerGui.ChildAdded:Connect(function(ok)
    if ok.Name == "Popup2" then
        ok:Destroy()
    end
end)
elseif getfenv().annoy == false then
getfenv().fun:Disconnect()
end
end)
    local example = library:CreateWindow({
        text = "Delivery Options"
      })
      example:AddLabel("Minimum Stars",function()
      end)
      example:AddBox("Enter Star Amount", function(object, focus)
        if focus then
       getfenv().stars = tonumber(object.Text)
        end
    end)
    example:AddLabel("Minimum Reward Money",function()
    end)
    example:AddBox("Enter Minimum Reward", function(object, focus)
        if focus then
       getfenv().smaller = tonumber(object.Text)
        end
    end)
    example:AddLabel("Maximum Reward Money",function()
    end)
    example:AddBox("Enter Maximum Reward", function(object, focus)
        if focus then
       getfenv().bigger = tonumber(object.Text)
        end
    end)
        example:AddToggle("Auto Delivery",function(state)
            getfenv().deliver2 = (state and true or false)
            resetcharactervalue = 0
            devpart = 1
            game.Players.LocalPlayer.Character.Head.Anchored = false
            spawn(function()
                while getfenv().deliver2 do
                    task.wait()
                    pcall(function()
                if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                    wait(5)
                    getfenv().spawned = false
                end
                end)
                end
                end)

                spawn(function()
            while getfenv().deliver2 do
                task.wait()
           if devpart ~= nil then
                resetcharactervalue=0
            elseif devpart == nil and resetcharactervalue >= 20 then
                resetcharactervalue=0
                game.Players.LocalPlayer.Character:BreakJoints()
wait(1)
            end
        end
                end)
                local function gettruck()
                    local truck = nil
                    for i,v in pairs(workspace.Cars:GetChildren()) do
                        if v.Name == "DeliveryTruck" and v:GetAttribute("JobId") == _G.remotetable.Jobs[1].Id then
                          truck = v
                    end
                    end
                    return truck or "no truck found"
                    end
                    print(gettruck())
                    spawn(function()
                        timeout = 0
                            while getfenv().deliver2 do
                        task.wait()
                    if gettruck() ~= "no truck found" and game.Players.LocalPlayer.Character.Humanoid.SeatPart== nil and timeout < 10 then
                    timeout = timeout + 1
                    wait(1)
                    elseif gettruck() ~= "no truck found" and game.Players.LocalPlayer.Character.Humanoid.SeatPart== nil and timeout >= 10 then
                        timeout = 0
                        warn("truck bugged and got destroyed")
                        gettruck():Destroy()
                        wait(1)
                      elseif gettruck() ~= "no truck found" and game.Players.LocalPlayer.Character.Humanoid.SeatPart~= nil  then
                        timeout = 0
                        print("timeout reset")
                        wait(1)
                    end
                    end
                    end)
                    spawn(function()
                        print("bro spawned in")
                        while getfenv().deliver2 do
                        task.wait()
                        if getfenv().checkif ~= nil then
                        wait(40)
                            getfenv().checkif = nil
                        end
                        end
                          end)
                          getfenv().checkif = nil
            while getfenv().deliver2 do
                wait()
          local p,call = pcall(function()
            if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                task.wait(0.1)
     devpart = nil
            for i,v in pairs(workspace.ActionTasksGames.Jobs:GetDescendants()) do
            if v.Name == "DeliveryPart" and v.Transparency ~= 1 and game.Players.LocalPlayer.Character.Humanoid.SeatPart ~= nil then
                devpart = v
                workspace.Gravity = 0
                game.Players.LocalPlayer.Character.Head.Anchored = false
                tppart = v
                getfenv().spawned = false
                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame)
                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame*CFrame.new(-30,30,-10))
                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame*CFrame.Angles(0,math.rad(90),0))
               for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:GetChildren()) do
                if v.ClassName == "Model" and v:GetAttribute("StockTurbo") then
                            repeat wait(0.1)
                                pcall(function()
                                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(tppart.CFrame)
                                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(tppart.CFrame*CFrame.new(-30,30,-10))
                                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(tppart.CFrame*CFrame.Angles(0,math.rad(90),0))
                                end)
                    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["Action"] = "TryToCompleteJob",["JobId"] = v.Name})
                            until game.Players.LocalPlayer.Character.Humanoid.SeatPart == nil or devpart.Transparency == 1 or getfenv().deliver2 == false
                            game.Players.LocalPlayer.Character.Head.Anchored = false
                            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                            local function getstars()
                            local stars = 0
                            for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MissionRewardStars").Frame.Stars:GetChildren()) do
                            if string.find(v.Name,"Star") and v.ImageColor3 == Color3.fromRGB(255, 189, 34) then
                            stars = stars+1
                            end
                        end
                        return stars
                        end
                        local function isused(hi)
                            yeno = nil
                            for i,v in pairs(_G.usedids) do
                            if v == hi then
                            yeno = "Vehicle was already used"
                            end
                            end
                            return yeno
                            end
                        print(tonumber(getstars()).." Stars bonus")
                        if tonumber(getstars()) < getfenv().stars and game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MissionRewardStars").Enabled == true and getfenv().checkif == nil then
                            whate = nil
                            if type(_G.usedids) ~= "table" then
                                _G.usedids = {}
                            end
                            for i,v in pairs(getgc(true)) do
                        if type(v) == "table" and rawget(v,"MoneyReward") ~= nil and whate == nil and getfenv().checkif == nil then
                            task.wait()
                        if tonumber(v.MoneyReward) > getfenv().smaller and tonumber(v.MoneyReward) < getfenv().bigger and whate == nil and getfenv().checkif == nil and isused(v.Id) ~= "Vehicle was already used" then
                        task.wait()
                            table.insert(_G.usedids,v.Id)
                        whate = v
                        print("Vehicle has been changed",v)
                        _G.remotetable = {["Truck"] = "DeliveryTruck",["Action"] = "StartDeliveryJob",["Jobs"] = {[1] = {["Id"] = whate.Id,["Image"] = "http://www.roblox.com/asset/?id=17094709022",["CFrame"] = CFrame.new(-1476.16199, 601.700134, 3489.31299, -1, 0, 0, 0, 1, 0, 0, 0, -1),["JobData"] = whate}}}
                        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars") then
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["JobId"] = game:GetService("Players").LocalPlayer.PlayerGui.MissionRewardStars:GetAttribute("JobId"),["Action"] = "CollectReward"})
                        wait(0.5)
                        game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars").Enabled = false
                        end
                        getfenv().checkif = true
                            end
                        end
                        end
                        end
                 
                        wait()
                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars") then
                        game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars").Enabled = false
                    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["JobId"] = game:GetService("Players").LocalPlayer.PlayerGui.MissionRewardStars:GetAttribute("JobId"),["Action"] = "CollectReward"})
                
                end                  
            end
                end 
            end
        end
        pcall(function()
        if devpart == nil  then
            resetcharactervalue=resetcharactervalue+1
        end
    end)
            elseif game.Players.LocalPlayer.Character.Humanoid.Sit == false and gettruck() == "no truck found" then
                print(gettruck())
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars") then
                    pcall(function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  tppart.CFrame
                    game.Players.LocalPlayer.Character.Head.Anchored = true
                    end)
                    wait(1)
                end
                whate = nil
                game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer(_G.remotetable)
            local unstck = 0
            repeat wait()
                unstck=unstck+1
            until gettruck() ~= "no truck found" or getfenv().deliver2 == false or unstck > 100
            workspace.Gravity = 196
            game.Players.LocalPlayer.Character.Head.Anchored = false
            end
        end)
        warn(p,call)
            end
        end)
        local example = library:CreateWindow({
            text = "Races"
          })
            example:AddToggle("Auto OVAL Race",function(state)
                _G.racetest = (state and true or false)
                while _G.racetest do
                    wait()
                if game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == false then
                    local chr = game.Players.LocalPlayer.Character
                local car = chr.Humanoid.SeatPart.Parent.Parent
                 car:PivotTo(CFrame.new(1056.281982421875, 603.333984375, 2519.3154296875))
                chr.Head.Anchored = true
                wait(1)
                chr.Head.Anchored = false
                wait(1)
                workspace.Races.RaceHandler.StartLobby:FireServer("Race")
                task.wait(15)
                local ohString1 = "5"
                local ohString2 = "VoteRace"
                
                workspace.Races.Race.Script.Vote:FireServer(ohString1, ohString2)
                task.wait(15)
                local ohString1 = "5"
                local ohString2 = "VoteLapsOval"
                
                workspace.Races.Race.Script.Vote:FireServer(ohString1, ohString2)
                repeat wait()
                until game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == true or _G.racetest == false
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == true then
                local function updategoal()
                    local goal = nil
                    local distance = math.huge
                    for i,v in pairs(workspace.Races:GetDescendants()) do
                        if v.Name == "GoalPart" and v.ClassName == "Part" then
                         local Dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
                            if Dist < distance then
                             distance = Dist
                               goal = v
                        end
                    end
                end
                return goal
                end
                local goal = updategoal()
                        repeat wait()
                            local test = nil
                        for i,v in pairs(game.Workspace.Races:GetDescendants()) do
                        if v.Name == "Checkpoint" and v.ClassName == "MeshPart" and v.Transparency ~= 1 then
                            test = v
                            workspace.Gravity = 0
                            local chr = game.Players.LocalPlayer.Character
                            local car = chr.Humanoid.SeatPart.Parent.Parent
                            dist = (chr.HumanoidRootPart.Position-v.Position).Magnitude
                            local TweenService = game:GetService("TweenService")
                            local TweenInfoToUse = TweenInfo.new(dist/420, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
                            local TweenValue = Instance.new("CFrameValue")
                            TweenValue.Value = car:GetPrimaryPartCFrame()     
                            TweenValue.Changed:Connect(function()
                            car:SetPrimaryPartCFrame(TweenValue.Value)
                            end)
                            local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=v.CFrame+Vector3.new(0,5,0)})
                            OnTween:Play()
                            OnTween.Completed:Wait()
                        end
                    end
                    local v = goal
                    local chr = game.Players.LocalPlayer.Character
                    local car = chr.Humanoid.SeatPart.Parent.Parent
                    dist = (chr.HumanoidRootPart.Position-v.Position).Magnitude
                    local TweenService = game:GetService("TweenService")
                    local TweenInfoToUse = TweenInfo.new(dist/300, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
                    local TweenValue = Instance.new("CFrameValue")
                    TweenValue.Value = car:GetPrimaryPartCFrame()     
                    TweenValue.Changed:Connect(function()
                    car:SetPrimaryPartCFrame(TweenValue.Value)
                    end)
                    local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=v.CFrame+Vector3.new(0,5,0)})
                    OnTween:Play()
                    OnTween.Completed:Wait()
                until test == nil or _G.racetest == false
                print("race done")
                local v = goal
                local chr = game.Players.LocalPlayer.Character
                local car = chr.Humanoid.SeatPart.Parent.Parent
                dist = (chr.HumanoidRootPart.Position-workspace.Races.Race.Oval.GoalPart.Position).Magnitude
                local TweenService = game:GetService("TweenService")
                local TweenInfoToUse = TweenInfo.new(dist/200, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
                local TweenValue = Instance.new("CFrameValue")
                TweenValue.Value = car:GetPrimaryPartCFrame()     
                TweenValue.Changed:Connect(function()
                car:SetPrimaryPartCFrame(TweenValue.Value)
                end)
                local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=workspace.Races.Race.Oval.GoalPart.CFrame})
                OnTween:Play()
                OnTween.Completed:Wait()
                workspace.Gravity = 196
                end
                end
            end)
            example:AddToggle("Auto Season 9 Race",function(state)
                _G.racetest2 = (state and true or false)
                while _G.racetest2 do
                    wait()
                if game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == false then
                    local chr = game.Players.LocalPlayer.Character
                local car = chr.Humanoid.SeatPart.Parent.Parent
                 car:PivotTo(CFrame.new(-2270.044189453125, 603.0210571289062, 413.31793212890625))
                chr.Head.Anchored = true
                wait(1)
                chr.Head.Anchored = false
                wait(1)
                workspace.Races.RaceHandler.StartLobby:FireServer("Season")
                task.wait(15)
                workspace.Races.Season.Script.Vote:FireServer("5", "Vote")
                repeat wait()
                until game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == true or _G.racetest2 == false
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == true then
                        repeat wait()
                            local test = nil
                        for i,v in pairs(game.Workspace.Races:GetDescendants()) do
                        if v.Name == "Checkpoint" and v.ClassName == "MeshPart" and v.Transparency ~= 1 then
                            test = v
                            workspace.Gravity = 0
                            local chr = game.Players.LocalPlayer.Character
                            local car = chr.Humanoid.SeatPart.Parent.Parent
                            dist = (chr.HumanoidRootPart.Position-v.Position).Magnitude
                            local TweenService = game:GetService("TweenService")
                            local TweenInfoToUse = TweenInfo.new(dist/140, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
                            local TweenValue = Instance.new("CFrameValue")
                            TweenValue.Value = car:GetPrimaryPartCFrame()     
                            TweenValue.Changed:Connect(function()
                            car:SetPrimaryPartCFrame(TweenValue.Value)
                            end)
                            local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=v.CFrame+Vector3.new(0,5,0)})
                            OnTween:Play()
                            OnTween.Completed:Wait()
                        end
                    end
                until test == nil or _G.racetest2 == false
                print("race done")
                local chr = game.Players.LocalPlayer.Character
                local car = chr.Humanoid.SeatPart.Parent.Parent
                dist = (chr.HumanoidRootPart.Position-workspace.Races.Season.GoalPart.Position).Magnitude
                local TweenService = game:GetService("TweenService")
                local TweenInfoToUse = TweenInfo.new(dist/200, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
                local TweenValue = Instance.new("CFrameValue")
                TweenValue.Value = car:GetPrimaryPartCFrame()     
                TweenValue.Changed:Connect(function()
                car:SetPrimaryPartCFrame(TweenValue.Value)
                end)
                local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=workspace.Races.Season.GoalPart.CFrame})
                OnTween:Play()
                OnTween.Completed:Wait()
                workspace.Gravity = 196
                end
                end
            end)
            example:AddToggle("Auto Drift Race",function(state)
            _G.racetest3 = (state and true or false)
            if _G.racetest3 == false then
            local distance = math.huge
            for a,b in pairs(workspace.DriftTrack:GetDescendants()) do
                if b.Name == "DriftAsphalt" and b.Parent.Name == "Model" then
            local Dist = (Vector3.new(-2567.529296875, 601.9335327148438, 2018.6964111328125) - b.Position).magnitude
            if Dist < distance then
            distance = Dist
            partvelo = b
            end
            end
            end
            partvelo.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*0
        end
            while _G.racetest3 do
                wait()
            if game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == false then
                local chr = game.Players.LocalPlayer.Character
            local car = chr.Humanoid.SeatPart.Parent.Parent
             car:PivotTo(CFrame.new(-2502.25146484375, 601.9251708984375, 2013.3966064453125))
             car.Engine.Velocity = Vector3.new(0,0,0)
             chr.Head.Anchored = true
             car.Engine.Velocity = Vector3.new(0,0,0)
             wait(1)
             car.Engine.Velocity = Vector3.new(0,0,0)
             chr.Head.Anchored = false
             car.Engine.Velocity = Vector3.new(0,0,0)
             wait(1)
             workspace.Races.RaceHandler.StartLobby:FireServer("Drift")
             partvelo = nil
             repeat wait()
                if game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(-2502.25146484375, 601.9251708984375, 2013.3966064453125)) > 10 then
                car:PivotTo(CFrame.new(-2502.25146484375, 601.9251708984375, 2013.3966064453125))
                car.Engine.Velocity = Vector3.new(0,0,0)
                wait(0.1)
                workspace.Races.RaceHandler.StartLobby:FireServer("Drift")
                end
             until game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == true or _G.racetest3 == false
             elseif game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == true then
    if partvelo == nil then
local distance = math.huge
for a,b in pairs(workspace.DriftTrack:GetDescendants()) do
    if b.Name == "DriftAsphalt" and b.Parent.Name == "Model" then
local Dist = (Vector3.new(-2567.529296875, 601.9335327148438, 2018.6964111328125) - b.Position).magnitude
if Dist < distance then
distance = Dist
partvelo = b
end
end
end
partvelo.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1000
end
if game.Players.LocalPlayer:DistanceFromCharacter(partvelo.Position) > 10 then
    local chr = game.Players.LocalPlayer.Character
    local car = chr.Humanoid.SeatPart.Parent.Parent
    car:PivotTo(partvelo.CFrame)
end
task.wait()
end
end
end)
