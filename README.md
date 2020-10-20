1. Install luarocks
2. run `luarocks make` on the root of this repo
3. you can run commands by running on `lua`:
```
Lua 5.3.5  Copyright (C) 1994-2018 Lua.org, PUC-Rio
> require 'executor'
true
> ls()
→ ls
README.md
executor-dev-1.rockspec
src

>
```

4. To run command for cmd:
```
lua -l executor -e "find_files('.', '*.py')"
```