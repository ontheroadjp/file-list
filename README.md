# file-list
This script is generate a file-list within specific directory.



## getting started

```bash
$ git clone https://github.com/ontheroadjp/file-list
$ PATH='/path/to/clone/dir:$PATH'
```



## usage

```bash
# list files at current directory
$ filelist .

# list files with absolute file path
$ filelist . -a

# include dot files if there
$ file . --dotfile

# list includes files which has extension of jpg or png
$ filelist . -e jpg -e png 
```



## options

```bash
Options:
  -h, --help                     Show help.
  -v, --version                  Show script version.
  -e, --extension ARG            List file specified file extention.
      --dotfile                  List dotfile(s).
  -a                             List file in absolute file path.
      --verbose                  Print various logging information
```

