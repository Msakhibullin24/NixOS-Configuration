{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "charlotte-suzu-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Charlotte-Suzu" "$iconsDir"

    runHook postInstall
  '';
}
