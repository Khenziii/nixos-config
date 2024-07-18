# WIP..
# Hm.. packaging stuff is harder than I've thought..

{ lib
, fetchFromGitHub
, python311
, python311Packages
}: let
  python-packages = with python311Packages; [
    astor
    keras-applications
    lxml
    matplotlib
    pandas
    pyside6
    python-magic
    scikit-learn
    tensorflow
    xgboost
    pillow
    pywavelets
  ];
in

python311Packages.buildPythonApplication {
  pname = "sherloq";
  version = "1.0"; # TODO

  pyproject = false;
  doCheck = false; # no tests on upstream

  src = fetchFromGitHub {
    owner = "GuidoBartoli";
    repo = "sherloq";
    rev = "57b33f73c7d350c3c03e6eed5fd5af38d8d48cbc";
    hash = "sha256-qOsqYB63W3PinMTQcsLaKG9o/acdZBA91Lk4t9XbRyQ=";
  };

  buildInputs = [
    python311
  ] ++ python-packages;

  meta = with lib; {
    description = "An open-source digital image forensic toolset";
    homepage = "https://github.com/GuidoBartoli/sherloq";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}

