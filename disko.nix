{
    disko.devices = {
        disk = {
            disk0 = {
                device = "/dev/nvme0n1";
                type = "disk";
                content = {
                    type = "gpt";
                    partitions = {
                        ESP = {
                            type = "EF00";
                            size = "256M";
                            content = {
                                type = "filesystem";
                                format = "vfat";
                                mountpoint = "/boot";
                                mountOptions = [ "umask=0077" ];
                            };
                        };
                        swap = {
                            size = "8G";    
                            content = {
                                type = "swap";
                            };
                        };
                        root = {
                            size = "100%";
                            content = {
                                type = "btrfs";
                                extraArgs = [ "-f" ];
                                mountpoint = "/";
                                mountOptions = [ "compress=zstd" "noatime" ];
                            };
                        };
                    };
                };
            };
            disk1 = {
                device = "/dev/sda";
                type = "disk";
                content = {
                    type = "gpt";
                    partitions = {
                        var = {
                            size = "150G";
                            content = {
                                type = "btrfs";
                                mountpoint = "/var";
                                mountOptions = [ "compress=zstd" "noatime" ];
                            };
                        };
                        home = {
                            size = "100%";
                            content = {
                                type = "btrfs";
                                mountpoint = "/home";
                                mountOptions = [ "compress=zstd" "noatime" ];
                            };
                        };
                    };
                };
            };
        };
    };
}
