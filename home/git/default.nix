{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gh-copilot
    github-cli
    gh-dash
    lazygit
  ];
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Andrii Nasinnyk";
        email = "anasinnyk@macpaw.com";
        signingkey = "39B4848268E66555";
      };
      init = {
        defaultBranch = "main";
      };
      url = {
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };
      commit = {
        gpgSign = true;
      };
      diff = {
        colormoved = "zebra";
      };
      alias = {
        huyak = "git add . && git commit --amend --no-edit && git push -f";
      };
    };
  };
}
