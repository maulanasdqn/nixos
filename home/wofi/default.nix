{pkgs, ...}: {
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;
    settings = {
      height = "40%";
      hide_scroll = true;
      insensitive = true;
      location = 2;
      matching = "fuzzy";
      mode = "run";
      prompt = "";
      term = "kitty";
      width = "40%";
      yoffset = 300;
      line_wrap = "word";
      single_click = true;
    };
    style = ''
      * {
        font-family: Hack Nerd Font;
      }

      window {
        margin: 1px;
        border: 10px solid #7aa2f7;
        border-radius: 10px;
      }

      #input {
        margin: 5px;
        border-radius: 0px;
        border: none;
        border-bottom: 0px solid #c0caf5;
        background-color: #1d202f;
        color: #c0caf5;
      }

      #inner-box {
        margin: 5px;
        background-color: #1d202f;
      }

      #outer-box {
        margin: 3px;
        padding: 20px;
        background-color: #1d202f;
        border-radius: 10px;
      }

      #text {
        margin: 5px;
        color: #c0caf5;
      }

      #entry:selected {
        background-color: #414868;
      }

      #text:selected {
        text-decoration-color: #c0caf5;
      }
    '';
  };
}
