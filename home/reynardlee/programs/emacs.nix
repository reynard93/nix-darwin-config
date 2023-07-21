
{ pkgs, fetchpatch, ... }: # You may have other arguments here
{
  programs.emacs = pkgs.emacsWithPackagesFromUsePackage {
    #config = ../programs/emacs/emacs.el;
    #defaultInitFile = true;
    package =
      if pkgs.stdenv.isDarwin
      then
        pkgs.emacsGit.overrideAttrs (old: {
          patches = (old.patches or []) ++ [
            # Patches URLs and sha256 hashes go here
          ];
          configureFlags = (old.configureFlags or []) ++ [
            "LDFLAGS=-headerpad_max_install_names"
          ];
        })
      else pkgs.emacsPgtk;
    alwaysEnsure = true;
    extraEmacsPackages = epkgs: [ epkgs.use-package ];
  };
}
