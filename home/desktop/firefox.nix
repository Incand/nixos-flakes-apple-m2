{ config, theme, font, ... }:
  let
    lock-false = {
      Value = false;
      Status = "locked";
    };
    lock-true = {
      Value = true;
      Status = "locked";
    };
  in
{
  programs.firefox = {
    enable = true;
    languagePacks = [ "de" "en-US" ];

    /* ---- POLICIES ---- */
    # Check about:policies#documentation for options.
    policies = {
      SearchEngines = {
        Default = "DuckDuckGo";
        # To remove "This time search with..."
        Remove = [
          "Bing"
          "Google"
          "Wikipedia"
          "Bookmarks"
          "Tabs"
          "History"
        ];
      };
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value= true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
      };
      PasswordManagerEnabled = false;

      /* ---- EXTENSIONS ---- */
      # Check about:support for extension/add-on ID strings.
      # Valid strings for installation_mode are "allowed", "blocked",
      # "force_installed" and "normal_installed".
      ExtensionSettings = {
        "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menubar";
        };
        # Tridactyl
        "tridactyl.vim@cmcaine.co.uk" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tridactyl-vim/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menubar";
        };
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
          default_area = "navbar";
        };
        # Simple Tab Groups
        "simple-tab-groups@drive4ik" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/simple-tab-groups/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menubar";
        };
      };

      /* ---- PREFERENCES ---- */
      # Check about:config for options.
      Preferences = { 
        "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
        "extensions.pocket.enabled" = lock-false;
        "extensions.screenshots.disabled" = lock-true;
        "browser.topsites.contile.enabled" = lock-false;
        "browser.formfill.enable" = lock-false;
        "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
        # fewer search suggestions
        "browser.urlbar.suggest.addons" = false;
        "browser.urlbar.suggest.calculator" = false;
        "browser.urlbar.suggest.clipboard" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.fakespot" = false;
        "browser.urlbar.suggest.mdn" = false;
        "browser.urlbar.suggest.pocket" = false;
        "browser.urlbar.suggest.quickactions" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.suggest.trending" = false;
        "browser.urlbar.suggest.weather" = false;
        "browser.urlbar.suggest.yelp" = false;

        "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
        "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
        "browser.newtabpage.activity-stream.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;

        "browser.fullscreen.autohide" = false; # still show bar when going fullscreen
        "intl.accept_languages" = "en-US, en, de";
        "browser.aboutConfig.showWarning" = false;
        "extensions.activeThemeID" = "default-theme@mozilla.org"; # use gtk theme
        "browser.urlbar.resultMenu.keyboardAccessible" = false; # not 3 dots when tabbing through suggestions
        "xpinstall.whitelist.required" = false;
        "xpinstall.signatures.required" = false;
        "browser.download.dir" = config.xdg.userDirs.download; # else it'd be $BROWSERHOME/Downloads
        "browser.translation.automaticallyPopup" = false;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.tabs.delayHidingAudioPlayingIconMS" = 0; # no delay for "playing" in tabbar (eg. youtube)
        "full-screen-api.warning.timeout" = 0; # no fullscreen warning
        "full-screen-api.transition.timeout" = 0; # go into fullscreen faster (maybe?)
        "extensions.pictureinpicture.enable_picture_in_picture_overrides" = true;
        "media.videocontrols.picture-in-picture.respect-disablePictureInPicture" = true;

        # "browser.startup.homepage" = "https://duckduckgo.com";
        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.search.order.1" = "DuckDuckGo";

        "signon.rememberSignons" = false;
        "widget.use-xdg-desktop-portal.file-picker" = 0;
        "browser.compactmode.show" = true;
        "browser.cache.disk.enable" = false; # Be kind to hard drive

        # Firefox 75+ remembers the last workspace it was opened on as part of its session management.
        # This is annoying, because I can have a blank workspace, click Firefox from the launcher, and
        # then have Firefox open on some other workspace.
        #"widget.disable-workspace-management" = true;

        # increase UI and font sizes for retina display
        "layout.css.devPixelsPerPx" = toString ((font.size + 1.0 - 1.0) / 15.0);
        "font.size.variable.x-western" = font.size;
        "font.size.variable.x-unicode" = font.size;
        "font.size.monospace.x-western" = font.size;
        "font.size.monospace.x-unicode" = font.size;

        # prefer system theme on websites
        "layout.css.prefers-color-scheme.content-override" = if theme.type == "dark" then 0 else 1;
      };
    };
  };
}

