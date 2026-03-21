{  
  description = "NixOS configuration with flake-parts";  
  inputs = {  
    # Add your inputs here  
  };  
  outputs = {  
    self: {  
      flake-url = "git::https://github.com/Unknown-device/nixos.git";  
    };  
    # Define per-system configurations for various targets  
    perSystem = {  
      x86_64-linux = {  
        # System configuration for x86_64  
      };  
      aarch64-linux = {  
        # System configuration for aarch64  
      };  
    };  
  };  
}  
