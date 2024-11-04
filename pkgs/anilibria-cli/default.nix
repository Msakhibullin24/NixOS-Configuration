{
  fetchFromGitHub,
  makeWrapper,
  stdenv,
  lib,
  jq,
  curl,
  ffmpeg,
  withMpv ? true,
  mpv,
  withVlc ? false,
  vlc,
}:
assert withMpv || withVlc;
  stdenv.mkDerivation rec {
    pname = "anilibria-cli";
    version = "1.1.0";

    src = fetchFromGitHub {
      owner = "Loureas";
      repo = pname;
      rev = "v${version}";
      hash = "sha256-duI0gTxNHoM0Yfh03fS+4ufuTmi1ZINCpCK2awtnFOA=";
    };

    dontBuild = true;

    nativeBuildInputs = [makeWrapper];
    runtimeDependencies = let
      player =
        []
        ++ lib.optional withMpv mpv
        ++ lib.optional withVlc vlc;
    in
      [jq curl ffmpeg]
      ++ player;

    installPhase = ''
      runHook preInstall

      install -Dm755 anilibria-cli $out/bin/anilibria-cli

      wrapProgram $out/bin/anilibria-cli \
        --prefix PATH : ${lib.makeBinPath runtimeDependencies}

      runHook postInstall
    '';

    meta = with lib; {
      homepage = "https://github.com/Loureas/anilibria-cli";
      description = "A cli tool to browse and play anime with Russian dubbing Anilibria.TV";
      license = licenses.gpl3Plus;
      mainProgram = "anilibria-cli";
    };
  }
