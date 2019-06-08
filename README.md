A JDK switcher for macOS
------------------------


## Install
Can be used in both Bash and ZSH. Just add it to your `.bashrc`/`.zshrc` and you're all set.

### Using it with a ZSH framework/plugin manager
### [zplug](https://github.com/b4b4r07/zplug)
Load macos-jdk as a plugin in your `.zshrc`

```shell
zplug "deluan/macos-jdk"
```
### [zgen](https://github.com/tarjoilija/zgen)

Include the load command in your `.zshrc`

```shell
zgen load deluan/macos-jdk
zgen save
```

### [antigen](https://github.com/zsh-users/antigen)

Bundle macos-zsh in your `.zshrc`

```shell
antigen bundle deluan/macos-jdk
antigen apply
```

### As an [Oh My ZSH!](https://github.com/robbyrussell/oh-my-zsh) custom plugin

Clone macos-jdk into your custom plugins repo

```shell
git clone https://github.com/deluan/macos-jdk $ZSH_CUSTOM/plugins/macos-jdk
```
Then load as a plugin in your `.zshrc`

```shell
plugins+=(macos-jdk)
```

## Usage

Show all installed versions
```
$ jdk
```

Select a specific version (only valid for current session)
```
$ jdk 8
```

To set the default jdk to be used in your system, create a `~/.jdkversion` file with the version number in it