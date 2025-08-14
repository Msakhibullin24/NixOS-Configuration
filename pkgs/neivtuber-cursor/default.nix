{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "neivtuber-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "NeiVtuber" "$iconsDir"

    runHook postInstall
  '';
}
