parted /dev/nvme0n1 --script \
  unit MiB \
  mklabel gpt \
  mkpart ESP fat32 1 1025 \
  set 1 boot on \
  mkpart swap linux-swap 1025 17409 \
  mkpart nix 17409 100% \
  print

mkswap -L SWAP /dev/nvme0n1p2

swapon /dev/nvme0n1p2

mkfs.btrfs -L Gentoo /dev/nvme0n1p3

mount -t btrfs -o compress=zstd /dev/nvme0n1p3 /mnt/gentoo

btrfs subvolume create /mnt/gentoo/@
btrfs subvolume create /mnt/gentoo/@home

btrfs subvolume list -p /mnt/gentoo

umount /mnt/gentoo

mount -v -t btrfs -o subvol=/@,compress=zstd /dev/nvme0n1p3 /mnt/gentoo

mkdir /mnt/gentoo/home

mount -v -t btrfs -o subvol=/@home,compress=zstd /dev/nvme0n1p3 /mnt/gentoo/home

mkfs.fat -F 32 -n ESP /dev/nvme0n1p1

mkdir --parents /mnt/gentoo/efi

mount -v /dev/nvme0n1p1 /mnt/gentoo/efi