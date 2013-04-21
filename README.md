
# Folder Compare

Compare folders and find duplicate files.

## Overview

Pass in folder paths and it recursively finds and shows duplicate files between (and inside) folders.

Compares size and timestamp. If files have the exact same size and timestamp, returns list of files.

You can pass in more than one path.

Built for OS X.

## Installing

	$ git clone https://github.com/jessc/folder_compare.git

## Usage

	$ ruby folder_compare.rb "path/to/folder_a" "path/to/folder_b"

## Example

	$ ruby folder_compare.rb "folder_a" "folder_b"

	/Users/jessc/folder_comparing/folder_a/same_file.txt
	/Users/jessc/folder_comparing/folder_a/subfolder_a/same_file.txt
	/Users/jessc/folder_comparing/folder_b/same_file.txt

	/Users/jessc/folder_comparing/folder_a/same_folder/same_diff_name.txt
	/Users/jessc/folder_comparing/folder_b/same_folder/same_diff_name.txt

## Contributing

 - For each group of duplicated files, prompt the user which file to keep (or all) then delete the rest.
 - Add an option to only show duplicate files between folders, rather than inside them.
