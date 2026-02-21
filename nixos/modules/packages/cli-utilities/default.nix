{ lib, ... }:

{
	imports = lib.my.scanPaths ./.; # Import all files in the directory, you might not like it
}
