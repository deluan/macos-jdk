JDK switcher for macOS
----------------------

Can be used in both Bash and ZSH. Just add it to your .bashrc/.zshrc

### Usage

Show all installed versions
```
$ jdk
```

Select a specific version (only valid for current session)
```
$ jdk 8
```

To set the default jdk to be used in your system, create a `~/.jdkversion` file with the version number in it