{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "menace-mamaki-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Menace-Mamaki" "$iconsDir"

    runHook postInstall
  '';
}
