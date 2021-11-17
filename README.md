# file-list
This script outputs a list of files in the specified directory.



## getting started

```bash
$ git clone https://github.com/ontheroadjp/file-list
$ PATH='/path/to/clone/dir:$PATH'
```



## usage

```bash
# list files at current directory
$ filelist

# list files with absolute file path
$ filelist -a

# include dot files if there
$ filelist --dotfile

# list includes files which has extension of jpg or png
$ filelist -e jpg -e png

# show file count
$ filelist -c

# show specific file type count
$ filelist -c -e md
```



## options

```bash
Options:
  -h, --help                     Show help.
  -v, --version                  Show script version.
  -e, --extension val            Limit the output file to the extension of siblings.
  -d, --delimiter val            Delimiter at output.
      --dotfile                  Also outputs a dot file.
  -a                             Output with absolute path.
  -c                             Show the number of files.
      --verbose                  Print various logging information
```

