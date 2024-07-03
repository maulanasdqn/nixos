{
  services.postgresql = {
    enable = true;
    ensureDatabases = ["dummy"];
    enableTCPIP = true;
    settings.port = 5432;
  };
}
