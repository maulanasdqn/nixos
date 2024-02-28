_final: prev: {

  dwm = prev.dwm.overrideAttrs (old: rec {
    patches = [
      ./dwm/patch/dwm-systray-6.4.diff
      ./dwm/patch/dwm-functionalgaps+pertag-6.2.diff
    ];
    configFile = prev.writeText "config.h" (builtins.readFile ./dwm/config.h);
    postPatch = old.postPatch or "" + ''

      echo 'Using own config file...'
       cp ${configFile} ./config.def.h'';
  });

}
