{ stdenv
, lib
, fetchFromGitHub
, pkg-config
, SDL2
}:

stdenv.mkDerivation {
  name = "sowon";

  src = fetchFromGitHub {
    owner = "tsoding";
    repo = "sowon";
    rev = "6fe9c214fcb92062d21a6951ca523d46f27da9d3";
    hash = "sha256-BLhbOwx/VVMG0fnOaLK66l7ryIHt9Q8T1mZsJSjYC0o=";
  };

  buildInputs = [ pkg-config SDL2 ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/applications

    mv ./sowon $out/bin
    echo "
        [Desktop Entry]
        Name=sowon
        GenericName=Starting Soon Timer for Tsoding Streams
        Keywords=clock;timer;countdown
        Exec=sowon
        Type=Application
    " > $out/share/applications/sowon.desktop
  '';

  meta = {
    description = "Starting Soon Timer for Tsoding Streams";
    homepage = "https://github.com/tsoding/sowon";
    license = lib.licenses.mit;
  };
}

