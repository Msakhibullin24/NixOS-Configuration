{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "m200-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "M200" "$iconsDir"

    runHook postInstall
  '';
}
