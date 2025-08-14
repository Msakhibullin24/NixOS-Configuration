{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "takaraka-koharu-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Takaraka-Koharu" "$iconsDir"

    runHook postInstall
  '';
}
