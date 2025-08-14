{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "yuurei-angel-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Yuurei-Angel" "$iconsDir"

    runHook postInstall
  '';
}
