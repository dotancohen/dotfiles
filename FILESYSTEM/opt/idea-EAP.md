
Keep this file in `/opt/` for reference!

# Download Jetbrains Idea EAP IDEs

## PhpStorm
https://confluence.jetbrains.com/display/PhpStorm/PhpStorm+Early+Access+Program

## PyCharm
https://www.jetbrains.com/pycharm/nextversion/#section=linux

## CLion
https://confluence.jetbrains.com/display/CLION/Early+Access+Program

## Rider .NET IDE
https://www.jetbrains.com/rider/download/

# Install

1. Install EAP versions to `/opt/`:
```
$ ls -l /opt/
drwxr-xr-x  8 root       root       4096 Dec 18 09:27 PhpStorm-163.10154.2
drwxr-xr-x 10 root       root       4096 Jan 10 12:57 pycharm-171.2014.23
```
    
2. Create CLI launchers in `/opt/` via `Tools -> Create Command-line Launcher...`
```
$ ls -l /opt/
-rwxr-xr-x  1 root       root         58 Dec 18 09:32 phpstorm
-rwxr-xr-x  1 root       root         56 Jan 10 13:02 pycharm
```

3. Create symlinks from `/usr/local/bin` to the launchers:
```
$ ls -l /usr/local/bin/
lrwxrwxrwx   1 root       root             21 Jan 10 13:07 phpstorm -> /opt/phpstorm
lrwxrwxrwx   1 root       root             21 Dec 18 09:36 pstorm -> /opt/phpstorm
lrwxrwxrwx   1 root       root             20 Jan 10 13:04 pycharm -> /opt/pycharm
```
    
5. When updating the applications, simply install them to `/opt/` and update the launchers.

