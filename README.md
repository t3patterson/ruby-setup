#Set-up Day 1

### Install ruby version 2.2.3
1. Install homebrew 

   ```
   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   
   ```

2. Install rbenv

   ```
   brew install rbenv
   ```

3. install ruby-build for `rbenv install` command

   ```
   brew install ruby-build
   ```  
  + NOTE: you may have to install install   [Xcode 6.4 and Xcode Command Line Tools](https://developer.apple.com/downloads/index.action)
  + You also might have to link up the brew!  
      ```
     brew link autoconf pkg-config
     ```

5. In your command line, install rbenv and ruby-build (so that you can use  `rbenv install`)

```
brew install rbenv ruby-build
```

6. In your command line, install rbenv and ruby-build (so that you can use  `rbenv install`)

```
brew install rbenv ruby-build
```

####Possible Errors
- *You must ''brew link autoconf pkg-config' before ruby-build can be installed*
  - **Solution:** install  
  
- *Some directories in /usr/local/share/locale aren't writable. This can happen if you "sudo make install" software that isn't managed by Homebrew. If a brew tries to add locale information to one of these directories, then the install will fail during the link step. You should probably `chown` them:*
  - You need to make sure that all the files and folders in /usr/local are writable by you.
  - **Solution:** in your command line type in: `sudo chown -R $USER /usr/local/share/locale`  
  
- *No such file or directory - /Library/Developer/CommandLineTools/usr/bin/clang*
  - **Solution:** Install Xcode 6.4 and  Command Line Tools (OS X 10.10) for Xcode 6.4
