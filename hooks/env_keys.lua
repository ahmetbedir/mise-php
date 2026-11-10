--- The archive holds the php binary at its root, so the install directory goes on PATH.
function PLUGIN:EnvKeys(ctx)
    return {
        { key = "PATH", value = ctx.path },
    }
end
