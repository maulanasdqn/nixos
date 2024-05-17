{pkgs, ...}: let
  kuncie = {
    user = {
      name = "Frontend Kuncie";
      email = "frontendkuncie@gmail.com";
    };
    core = {
      sshCommand = "ssh -i ~/.ssh/id_ed25519_kuncie";
    };
  };
  personal = {
    user = {
      name = "Maulana Sodiqin";
      email = "maulanasdqn@gmail.com";
    };
    core = {
      sshCommand = "ssh -i ~/.ssh/id_ed25519_personal";
    };
  };
  dot = {
    user = {
      name = "Maulana Sodiqin";
      email = "msdqn@outlook.com";
    };
    core = {
      sshCommand = "ssh -i ~/.ssh/id_ed25519_dot";
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
      core = {excludesfile = "$NIXOS_CONFIG_DIR/scripts/gitignore";};
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
        condition = "gitdir:~/Development/dot";
        contents.user = dot.user;
        contents.core = dot.core;
      }
      {
        condition = "gitdir:~/Development/personal";
        contents.user = personal.user;
        contents.core = personal.core;
      }
      {
        condition = "gitdir:~/Development/berry";
        contents.user = personal.user;
        contents.core = personal.core;
      }
      {
        condition = "gitdir:~/.config/nixos";
        contents.user = personal.user;
        contents.core = personal.core;
      }
      {
        condition = "gitdir:~/Development/kuncie";
        contents.user = kuncie.user;
        contents.core = kuncie.core;
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
