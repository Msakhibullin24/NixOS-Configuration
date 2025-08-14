{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "kiana-herrscher-of-finality-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Kiana-(Herrscher-of-Finality)" "$iconsDir"

    runHook postInstall
  '';
}
