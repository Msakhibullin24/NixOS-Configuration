{
  fetchFromGitHub,
  stdenv,
  lib,
  cmake,
  boost,
  openssl,
  zlib,
  curl,
  pkg-config,
}:
stdenv.mkDerivation rec {
  pname = "tgbot-cpp";
  version = "1.8";

  src = fetchFromGitHub {
    owner = "reo7sp";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-rlC9fUzGlmp3tZhE6MlAtZWz4CIacJ757NB3bNRyXj0=";
  };

  buildInputs = [boost openssl zlib curl];
  nativeBuildInputs = [cmake pkg-config];

  meta = {
    description = "C++ library for Telegram bot API.";
    homepage = "https://github.com/reo7sp/tgbot-cpp";
    license = lib.licenses.mit;
  };
}
