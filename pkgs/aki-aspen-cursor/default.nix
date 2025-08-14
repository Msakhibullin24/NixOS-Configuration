{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "aki-aspen-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Aki-Aspen" "$iconsDir"

    runHook postInstall
  '';
}
