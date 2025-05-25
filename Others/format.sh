parted /dev/nvme0n1 --script \
  unit MiB \
  mklabel gpt \
  mkpart ESP fat32 1 1025 \
  set 1 boot on \
  mkpart swap linux-swap 1025 17409 \
  mkpart nix 17409 100% \
  print

mkfs.fat -F 32 -n ESP /dev/nvme0n1p1

mkswap -L Swap /dev/nvme0n1p2

mkfs.btrfs -L NixOS /dev/nvme0n1p3

mount -t btrfs -o compress=zstd /dev/nvme0n1p3 /mnt

btrfs subvolume create /mnt/@nix
btrfs subvolume create /mnt/@persistent

umount /mnt

mount -v -t tmpfs none /mnt

mkdir -v -p /mnt/{boot,nix,persistent,etc,var}

mount -v /dev/nvme0n1p1 /mnt/boot -o umask=0077

mount -v -t btrfs -o subvol=/@nix,compress=zstd /dev/nvme0n1p3 /mnt/nix
mount -v -t btrfs -o subvol=/@persistent,compress=zstd /dev/nvme0n1p3 /mnt/persistent

mkdir /mnt/etc/nixos && mkdir /mnt/var/log
mkdir /mnt/persistent/etc && mkdir /mnt/persistent/var
mkdir /mnt/persistent/etc/nixos && mkdir /mnt/persistent/var/log

mount -v -o bind /mnt/persistent/etc/nixos /mnt/etc/nixos
mount -v -o bind /mnt/persistent/var/log /mnt/var/log

swapon /dev/nvme0n1p2
