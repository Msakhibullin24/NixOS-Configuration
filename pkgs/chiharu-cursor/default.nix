{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "chiharu-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Chiharu" "$iconsDir"

    runHook postInstall
  '';
}
