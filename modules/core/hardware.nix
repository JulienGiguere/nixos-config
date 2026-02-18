{ pkgs,lib, ... }:
{
  # hardware = {
  #   graphics = {
  #     enable = true;
  #   };
  # };

  # Enable OpenGL/Vulkan support
  hardware.opengl = {
    enable = true;

    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      intel-compute-runtime
      intel-vaapi-driver

      # Critical Vulkan packages
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
      vulkan-tools
      vulkan-headers
      mesa
    ];
  };

  # Session variables
  environment.sessionVariables = {
    VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/intel_icd.x86_64.json";
    # Build the library path properly
    LD_LIBRARY_PATH = lib.makeLibraryPath [
      pkgs.vulkan-loader
      pkgs.mesa
    ] + ":/run/opengl-driver/lib";
  };

  # Make sure your user can access GPU
  users.users.julien.extraGroups = [ "video" "render" ];

  hardware.enableRedistributableFirmware = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
}
