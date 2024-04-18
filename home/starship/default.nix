{ pkgs, lib, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$kubernetes"
        "$directory"
        "$git_branch"
        "$git_status"
        "$nodejs"
        "$rust"
        "$golang"
        "$haskell"
        "$line_break"
        "$character"
      ];

      add_newline = false;

      kubernetes = {
        disabled = false;
      	format = "[$context:$namespace](yellow bold) ";
      };

      directory = {
        truncate_to_repo = true;
        truncation_length = 1;
        format = "[$path]($style)[$lock_symbol]($lock_style) ";
      };

      golang = {
        symbol = " ";
      };

      line_break = {
        disabled = true;
      };
    };
  };
}
