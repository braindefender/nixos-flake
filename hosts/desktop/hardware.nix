{
  config,
  lib,
  pkgs,
  ...
}: {
  # Define hostname
  networking.hostName = "desktop";

  # Boot options
  boot = {
    # Before boot
    initrd = {
      kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
      availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
    };

    # After boot
    kernelModules = ["kvm-intel"];
  };

  # Enable NVidia drivers for X and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  # TODO: Check
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = false;

  # Enable Bluetooth service
  services.blueman.enable = true;

  # Enable Intel microcode
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
