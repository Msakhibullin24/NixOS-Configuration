{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "niryna-hanaki-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Niryna-Hanaki" "$iconsDir"

    runHook postInstall
  '';
}
