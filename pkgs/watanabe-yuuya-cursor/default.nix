{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "watanabe-yuuya-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Watanabe-Yuuya" "$iconsDir"

    runHook postInstall
  '';
}
