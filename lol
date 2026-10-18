local folderCount = 999999999
local txtCount = 99999999
local fileSize = 4 * 1024 * 1024 -- 4 MiB per file
local repeatCreation = true

-- Generate file contents once
local content = string.rep("A", fileSize)

-- Create folders and files
for i = 1, folderCount do
    local folder = "Folder_" .. i

    if not isfolder(folder) then
        makefolder(folder)
    end

    for j = 1, txtCount, 10 do
        for k = j, math.min(j + 2, txtCount) do
            task.spawn(function()
                local file = folder .. "/File_" .. k .. ".txt"
                writefile(file, content)
                print("Created: " .. file)
            end)
        end
        task.wait()
    end
end

-- Repeat with no intentional delay
if repeatCreation then
    local run = true

    while run do
        task.wait() -- Yields to avoid locking up the executor
        print("System")
    end
end
