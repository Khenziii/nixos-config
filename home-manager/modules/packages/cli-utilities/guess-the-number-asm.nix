{ stdenv
, lib
, fetchFromGitHub
}:

stdenv.mkDerivation {
  name = "guess-the-number-asm";

  src = fetchFromGitHub {
    owner = "khenziii";
    repo = "guess-the-number-asm";
    rev = "v1.0.0";
    hash = "sha256-jHmPcMpqhb3roNSclNfW4b161JEMaRu9jx6qR9Ip4RA=";
  };

  installPhase = ''
    mkdir -p $out/bin

    # Add a debug script if attempted to install on an OS different from Linux.
    os_name=$(uname -s)
	if [ "$os_name" != "Linux" ]; then
	  echo "
        #!/bin/sh
 
        echo 'This program uses the Linux kernel! It will NOT work on $os_name.'
        exit 1
      " > guess-the-number-asm
	fi

    # Add a debug script if attempted to install
    # on a CPU architecture different than x86_64.
    cpu_architecture=$(uname -m)
    if [ "$cpu_architecture" != "x86_64" ]; then
	  echo "
        #!/bin/sh
 
        echo 'This program was made for the x86_64 CPU architecture. You are using: $cpu_architecture.'
        exit 1
      " > guess-the-number-asm
    fi

    if [ -f "guess-the-number-asm" ]; then
      chmod +x guess-the-number-asm
      mv guess-the-number-asm $out/bin
        
      exit 0
    fi

    as guess-the-number.s -o guess-the-number.o
    ld guess-the-number.o -o guess-the-number

    mv guess-the-number guess-the-number-asm
    mv guess-the-number-asm $out/bin
  '';

  meta = {
    description = "Guess the number game written in assembly";
    homepage = "https://github.com/khenziii/guess-the-number-asm";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.linux;
  };
}

