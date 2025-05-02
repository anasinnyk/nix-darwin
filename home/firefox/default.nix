{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    # package = pkgs.firefox-beta-bin;

    policies = {
      DisablePocket = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      TranslateEnabled = true;
      HttpsOnlyMode = "enabled";
      HardwareAcceleration = true;
      ExtensionSettings = {
        "*".installation_mode = "blocked";
        "uBlock@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
          installation_mode = "force_installed";
        };
        "{443bc2e2-8fa9-44ec-828a-fd84c0664f8d}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/gifs-for-github/latest.xpi";
          installation_mode = "force_installed";
        };
        "{eb8c4a94-e603-49ef-8e81-73d3c4cc04ff}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/gruvbox-dark-theme/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

  };
}
