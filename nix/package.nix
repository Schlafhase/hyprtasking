{
  gcc15Stdenv,
  meson,
  ninja,
  hyprland,
  lib,
}:
gcc15Stdenv.mkDerivation {
  pname = "hyprtasking";
  version = "0.1";

  src = ../.;

  nativeBuildInputs = [meson ninja] ++ hyprland.nativeBuildInputs;
  buildInputs = [hyprland] ++ hyprland.buildInputs;

  meta = {
    homepage = "https://github.com/raybbian/hyprtasking";
    description = "Powerful workspace management plugin, packed with features ";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.linux;
  };
}
