local util = {}

util.REPO = "ahmetbedir/php"

--- Release asset platform suffix for the current machine, e.g. "linux-aarch64-musl".
function util.platform()
    local arch
    if RUNTIME.archType == "amd64" then
        arch = "x86_64"
    elseif RUNTIME.archType == "arm64" then
        arch = "aarch64"
    else
        error("Unsupported architecture: " .. tostring(RUNTIME.archType))
    end

    if RUNTIME.osType == "linux" then
        -- static musl build runs on any Linux distro
        return "linux-" .. arch .. "-musl"
    elseif RUNTIME.osType == "darwin" then
        return "macos-" .. arch
    end
    error("Unsupported OS: " .. tostring(RUNTIME.osType))
end

return util
