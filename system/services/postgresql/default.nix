{ pkgs, ... }: {
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "dummy" ];
    enableTCPIP = true;
    port = 5432;
    authentication = pkgs.lib.mkOverride 10 ''
      #...
      #type database DBuser origin-address auth-method
      # ipv4
      host  all      all     127.0.0.1/32   trust
      # ipv6
      host all       all     ::1/128        trust
    '';
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE admin WITH LOGIN PASSWORD 'admin' CREATEDB;
      CREATE DATABASE dummy;
      GRANT ALL PRIVILEGES ON DATABASE admin TO admin;
    '';
  };
}
