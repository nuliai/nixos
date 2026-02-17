{ userName, ... }:
{
  users.users."${userName}" = {
    isNormalUser = true;
    description = "nuli";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    useDefaultShell = true;
    # hashedPassword = "$y$j9T$6gZ7oMbqXxIUsVlSDyYLv.$m/H7OSzGtWs6va8gu93FZaduMmutzEbGDlnoCw6G1LC";
    # packages = with pkgs; [
    #   #  thunderbird
    # ];
  };
}
