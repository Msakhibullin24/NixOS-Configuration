{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  zip,
  inkscape,
  just,
  xcursorgen,
  hyprcursor,
  xcur2png,
  catppuccin-whiskers,
  python3,
  python3Packages,
  flavor ? "frappe",
  accent ? "blue",
}:
let
  validFlavors = [
    "frappe"
    "latte"
    "macchiato"
    "mocha"
  ];
  validAccents = [
    "blue"
    "dark"
    "flamingo"
    "green"
    "lavender"
    "light"
    "maroon"
    "mauve"
    "peach"
    "pink"
    "red"
    "rosewater"
    "sapphire"
    "sky"
    "teal"
    "yellow"
  ];
  pname = "catppuccin-cursors";
  version = "1.0.2";
in
lib.checkListOfEnum "${pname}: accent colors" validAccents [ accent ] lib.checkListOfEnum
  "${pname}: flavors"
  validFlavors
  [ flavor ]
  stdenvNoCC.mkDerivation
  {
    inherit pname version;

    src = fetchFromGitHub {
      owner = "catppuccin";
      repo = "cursors";
      rev = "v${version}";
      hash = "sha256-Mm0fRh/Shem65E/Cl0yyw+efEHOEt/OJ+MzL+3Mcbwc=";
    };

    nativeBuildInputs = [
      zip
      just
      inkscape
      xcursorgen
      hyprcursor
      xcur2png
      catppuccin-whiskers
      python3
      python3Packages.pyside6
    ];

    buildPhase = ''
      runHook preBuild

      patchShebangs .

      just build "${flavor}" "${accent}"

      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall

        local iconsDir="$out"/share/icons

        mkdir -p "$iconsDir"

        mv "dist/catppuccin-${flavor}-${accent}-cursors" "$iconsDir"

      runHook postInstall
    '';

    meta = {
      description = "Catppuccin cursor theme based on Volantes";
      homepage = "https://github.com/catppuccin/cursors";
      license = lib.licenses.gpl2;
      platforms = lib.platforms.linux;
    };
  }
