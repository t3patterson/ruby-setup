#Set-up Day 1

### Install ruby version 2.2.3
1. Install homebrew 

   ```
   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   
   ```

2. Install rbenv

   ```
   brew install rbenv ruby-build
   ```  

3. Install ruby version 2.2.3

   ```
   rbenv install 2.2.3
   ```

4. Switch over to version 2.2.3 globally

   ```
   rbenv global 2.2.3
   ```

5.  Make sure that the `.rbenv` path is configured in `~/.bash_profile` at the end of the file
```
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
```

6.  Rerun the bash profile so that it is current
```
$  source ~/.bash_profile
```

7. Test for the ruby version with `ruby -v` 
```
> ruby 2.2.3p173
```
