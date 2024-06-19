{ inputs, ... }:

{ 
  users.users.${inputs.username} = {
    isNormalUser = true;
    description = "Khenzii";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}

