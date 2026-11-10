local util = require("util")

--- Returns the archive URL; mise downloads and extracts it into the install directory.
function PLUGIN:PreInstall(ctx)
    local version = ctx.version
    local platform = util.platform()
    return {
        version = version,
        url = "https://github.com/" .. util.REPO .. "/releases/download/" .. version
            .. "/php-" .. version .. "-" .. platform .. ".tar.gz",
    }
end
