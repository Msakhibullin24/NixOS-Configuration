{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "black-swan-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Black-Swan" "$iconsDir"

    runHook postInstall
  '';
}
