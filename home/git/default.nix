{pkgs, ...}: let
  astra = {
    user = {
      name = "Maulana Sodiqin";
      email = "maulana@dot-indonesia.com";
    };
    core = {
      sshCommand = "ssh -i ~/.ssh/id_astra";
    };
  };
  personal = {
    user = {
      name = "Maulana Sodiqin";
      email = "sodiqincahyana1@gmail.com";
    };
    core = {
      sshCommand = "ssh -i ~/.ssh/id_personal";
    };
  };
  dot = {
    user = {
      name = "Maulana Sodiqin";
      email = "msdqn@outlook.com";
    };
    core = {
      sshCommand = "ssh -i ~/.ssh/id_dot";
    };
  };
in {
  home.packages = with pkgs; [git-filter-repo];
  programs.git = {
    enable = true;
    extraConfig = {
      user.useConfigOnly = true;
      init = {defaultBranch = "main";};
      push = {autoSetupRemote = true;};
      core = {
        excludesfile = "$NIXOS_CONFIG_DIR/scripts/gitignore";
        sshCommand = "ssh -i ~/.ssh/id_personal";
      };
      url = {
        "git@gitlab.dot.co.id:" = {
          insteadOf = "https://gitlab.dot.co.id/";
        };
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };
    };
    includes = [
      {
        condition = "hasconfig:remote.*.url:git@gitlab.dot.co.id:*/*";
        contents.user = dot.user;
        contents.core = dot.core;
      }
      {
        condition = "hasconfig:remote.*.url:git@github.com:maulanasdqn/*";
        contents.user = personal.user;
        contents.core = personal.core;
      }
      {
        condition = "gitdir:~/.config/nix/config";
        contents.user = personal.user;
        contents.core = personal.core;
      }
      {
        condition = "hasconfig:remote.*.url:git@github.com:project-torq/*";
        contents.user = astra.user;
        contents.core = astra.core;
      }
    ];
  };
  programs.gh.enable = true;
  programs.gh.settings.git_protocol = "ssh";
  programs.gh.settings.aliases = {
    co = "pr checkout";
    pv = "pr view";
  };
}
