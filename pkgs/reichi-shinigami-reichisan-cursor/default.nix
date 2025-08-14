{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "reichi-shinigami-reichisan-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Reichi-Shinigami-(Reichisan)" "$iconsDir"

    runHook postInstall
  '';
}
