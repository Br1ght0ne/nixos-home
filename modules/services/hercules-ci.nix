{ config, lib, ... }:

{
  imports = [
    (builtins.fetchTarball
      "https://github.com/hercules-ci/hercules-ci-agent/archive/stable.tar.gz"
      + "/module.nix")
  ];

  services.hercules-ci-agent.concurrentTasks = lib.mkDefault config.nix.maxJobs;
}
