{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "rin-penrose-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Rin-Penrose" "$iconsDir"

    runHook postInstall
  '';
}
