function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

function _G.screengrab(...)
    local imgpath = vim.api.nvim_call_function('expand', {'%:p'})
    imgpath = imgpath:match("(.*/)") .. "img"
    local ok, err, code = os.rename(imgpath, imgpath)
    if not ok then
        print("could not take screenshot: " .. imgpath .. " does not exist")
    else
        io.popen("flameshot gui -p " .. imgpath)
        local handle = io.popen("inotifywait -e create -t 20 " .. imgpath .. " 2> /dev/null | awk '{print $3}'")
        local filename = handle:read("*a")
        handle:close()
        filename = string.gsub(filename, '^%s+', '')
        filename = string.gsub(filename, '%s+$', '')
        filename = string.gsub(filename, '[\n\r]+', ' ')

        --if string.find(vim.bo.filetype, 'markdown') then
            filename = "![](./img/" .. filename .. ")"
        --end

        vim.api.nvim_put({filename}, "", true, true)
    end
end
