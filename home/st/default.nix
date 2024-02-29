{ pkgs, ... }:

{
  home.packages = with pkgs;
    [
      (st.overrideAttrs (oldAttrs: rec {
        buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
        patches = [

        ];
        configFile = writeText "config.h" (builtins.readFile ./config.h);
        postPatch = ''
          ${oldAttrs.postPatch}
           cp ${configFile} ./config.def.h'';
      }))
    ];

}
