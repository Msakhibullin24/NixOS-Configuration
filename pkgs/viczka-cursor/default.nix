{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "viczka-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Viczka" "$iconsDir"

    runHook postInstall
  '';
}
