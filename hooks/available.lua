local http = require("http")
local json = require("json")
local util = require("util")

--- Lists installable versions: release tags that start with a digit (skips extras-*).
function PLUGIN:Available(ctx)
    local headers = { ["Accept"] = "application/vnd.github+json" }
    -- GITHUB_TOKEN avoids the 60 requests/hour anonymous API limit
    local token = os.getenv("GITHUB_TOKEN")
    if token ~= nil and token ~= "" then
        headers["Authorization"] = "Bearer " .. token
    end

    local resp, err = http.get({
        url = "https://api.github.com/repos/" .. util.REPO .. "/releases?per_page=100",
        headers = headers,
    })
    if err ~= nil then
        error("Failed to fetch releases: " .. err)
    end
    if resp.status_code ~= 200 then
        error("Failed to fetch releases: HTTP " .. resp.status_code)
    end

    local result = {}
    for _, release in ipairs(json.decode(resp.body)) do
        local tag = release.tag_name
        if tag ~= nil and tag:match("^%d") and not release.draft then
            table.insert(result, { version = tag })
        end
    end
    return result
end
