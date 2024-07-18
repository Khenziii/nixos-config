# WIP!!! This package is not ready to be used.

{ lib
, stdenv
, fetchurl
, makeWrapper
, gtk2
, gtk3
, electron
, atk
, glib
, cairo
}:

stdenv.mkDerivation rec {
  pname = "soundnode";
  version = "7.0.0";

  src = fetchurl {
    url = "https://github.com/Soundnode/soundnode-app/releases/download/${version}/Soundnode-linux-x64.tar.xz";
    sha256 = "1g0j9n7bmzdgidrf17n2zwcmhnx2l97y4dd7p4g0xc1xv2d3hpgl";
  };

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ gtk2 gtk3 atk glib cairo electron ];

  installPhase = ''
    mkdir -p $out/bin $out/lib $out/share/soundnode

    cp Soundnode $out/bin
    cp -r locales resources $out/share/soundnode
    cp *.pak $out/share/soundnode
    cp lib*.so natives_blob.bin snapshot_blob.bin icudtl.dat $out/lib

    wrapProgram $out/bin/Soundnode \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath buildInputs}:$out/lib"
  '';

  meta = with lib; {
    description = "Soundcloud desktop client";
    homepage = "https://github.com/Soundnode/soundnode-app";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}

