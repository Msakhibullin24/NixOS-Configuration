{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "liv-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "LIV" "$iconsDir"

    runHook postInstall
  '';
}
