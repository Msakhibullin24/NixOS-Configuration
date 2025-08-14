{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "hoshimi-miyami-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Hoshimi-Miyami" "$iconsDir"

    runHook postInstall
  '';
}
