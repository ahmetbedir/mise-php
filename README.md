# mise-php

A [mise](https://mise.jdx.dev) plugin (vfox format) that installs prebuilt static PHP CLI binaries from [ahmetbedir/php](https://github.com/ahmetbedir/php/releases). Nothing is compiled on your machine.

## Usage

```bash
mise plugins install php https://github.com/ahmetbedir/mise-php

# Latest 8.4.x
mise use -g php@8.4

# Specific version
mise use -g php@8.4.27

php -v
```

List available versions:

```bash
mise ls-remote php
```

## Supported platforms

| OS | Architecture | Build |
|---|---|---|
| Linux (any distro) | x86_64, aarch64 | static, musl |
| macOS | x86_64, arm64 | static |

A version can only be installed on a platform it was built for. Check the release page of that version to see which platforms are available.

## Notes

- Set `GITHUB_TOKEN` if you hit the GitHub API rate limit (60 requests/hour without a token).
- This plugin replaces mise's built-in `php` tool, which compiles PHP from source.
