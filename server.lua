local webhook = ""

local function logToDiscord(username, message)
    local data = {
        username = username,
        content = message
    }
    PerformHttpRequest(webhook, function(statusCode, response, headers)
    end, "POST", json.encode(data), {["Content-Type"] = "application/json"})
end

-- Command registration
RegisterCommand("dvall", function(source)
    if IsPlayerAceAllowed(source, 'dvall') then
        TriggerClientEvent("harry:deleteUnoccupiedVehicles", -1)
        
        local playerName = GetPlayerName(source)
        local message = string.format("^4%s ^7executed the /dvall command, which will remove all unoccupied vehicles in 15 seconds.", playerName)
        logToDiscord("Server", message)
    else
        TriggerClientEvent("chat:addMessage", source, { args = { "^1[ERROR] ^7You do not have permission to execute this command." } })
    end
end, false)
