# filelist

`filelist` is a command-line tool written in Go that provides a simple way to list files and directories. It offers flexible options for filtering and formatting the output, making it useful for various scripting and automation tasks.

## Features

*   **Recursive Listing:** List files and directories recursively from a specified path.
*   **Filtering:** Include or exclude files based on glob patterns.
*   **Output Formatting:** Customize the output format to display file paths, sizes, modification times, and more.
*   **Cross-Platform:** Built with Go, `filelist` runs on Windows, macOS, and Linux.

## Installation

### From Source

To install `filelist` from source, you need to have Go installed (version 1.16 or later is recommended).

1.  Clone the repository:
    ```bash
    git clone https://github.com/ontheroadjp/file-list.git
    cd file-list
    ```
2.  Build and install the executable:
    ```bash
    go install ./...
    ```
    This will install the `filelist` executable to your `GOPATH/bin` directory. Make sure `GOPATH/bin` is in your system's `PATH`.

### Pre-compiled Binaries (Coming Soon)

Pre-compiled binaries for various operating systems will be available on the [releases page](https://github.com/ontheroadjp/file-list/releases).

## Usage

The basic usage of `filelist` is as follows:

```bash
filelist [options] [path]
```

If `path` is not specified, `filelist` will operate on the current directory.

### Examples

1.  **List all files and directories recursively in the current directory:**
    ```bash
    filelist
    ```

2.  **List only `.txt` files in a specific directory:**
    ```bash
    filelist -include "*.txt" /path/to/your/directory
    ```

3.  **List files excluding `.git` directories:**
    ```bash
    filelist -exclude ".git"
    ```

4.  **Display file size and modification time:**
    ```bash
    filelist -format "{{.Path}} {{.Size}} {{.ModTime}}"
    ```

### Options

*   `-include <pattern>`: Include files matching the glob pattern. Can be specified multiple times.
*   `-exclude <pattern>`: Exclude files matching the glob pattern. Can be specified multiple times.
*   `-format <template>`: Specify the output format using Go template syntax. Available fields:
    *   `.Path`: Full path of the file/directory.
    *   `.Name`: Base name of the file/directory.
    *   `.Size`: Size of the file in bytes.
    *   `.ModTime`: Last modification time.
    *   `.IsDir`: Boolean, true if it's a directory.
*   `-recursive`: (Default) List files and directories recursively.
*   `-depth <n>`: Limit recursion depth to `n`.

## Contributing

Contributions are welcome! Please feel free to open issues or submit pull requests.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
