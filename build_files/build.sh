#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Negativo17
# dnf -y config-manager addrepo --from-repofile="https://negativo17.org/repos/fedora-nvidia.repo
# dnf -y config-manager addrepo --from-repofile="https://negativo17.org/repos/fedora-multimedia.repo
# Enabling needed COPRs
#dnf -y copr enable bieszczaders/kernel-cachyos
#dnf -y copr enable bieszczaders/kernel-cachyos-addons

gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer', 'kms-modifiers', 'autoclose-xwayland', 'variable-refresh-rate', 'xwayland-native-scaling']"

dnf -y copr enable peterwu/iosevka
dnf -y copr enable solopasha/hyprland
dnf -y copr enable yalter/niri
dnf -y copr enable tofik/nwg-shell
dnf -y copr enable atim/starship
#dnf -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
#dnf -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
dnf -y check-update make-cache --refresh

# Installing extra packages over Workstation
dnf -y install \
fish atuin hyprland hyprland-plugin-hyprbars stow hyprlock hypridle hyprpaper hyprlock hyprshot hyprdim hyprsunset \
cliphist waybar waypaper blueman network-manager-applet xwaylandvideobridge udiskie mpv feh zoxide jq qt6ct qt5ct \
qt6-qtwayland qt5-qtwayland copyq lsd ImageMagick GraphicsMagick swww wlogout wl-paste wl-clipboard wl-copy \
nwg-clipman nwg-shell-config nwg-drawer python-psutil fd brightnessctl btrbk micro restic bat cosmic-term starship \
swaync cargo satty vips uwsm breeze-gtk plasma-breeze rsms-inter{,-vf}-fonts jetbrains-mono-fonts-all iosevka-etoile-fonts \
meson cmake scdoc dmenu python3-pyxdg python3-dbus gtk3-devel gtk4-devel gobject-introspection-devel gtk-layer-shell-devel \
kdeconnectd kde-connect-nautilus alacritty kitty btrbk zoxide direnv opendoas niri xwayland-satellite swayidle swaylock-effects \
swaybg xfce-polkit lxqt-policykit restic micro labwc ghostty wpaperd wlsunset --skip-unavailable
# brave-{browser,keyring} --allowerasing
dnf -y ghostty --best --allowerasing
#dnf -y install libcap-ng libcap-ng-devel procps-ng procps-ng-devel cachyos-ksm-settings kernel-cachyos kernel-cachyos-devel-matched

#pushd /etc/yum.repos.d || return
#curl -sL# https://raw.githubusercontent.com/zumnebeltech/ZumNebelOS/refs/heads/main/<filename>
#popd

mkdir -pv /etc/kernel/postinst.d
#pushd /etc/kernel/postinst.d || return
#curl -sOL# https://raw.githubusercontent.com/zumnebeltech/ZumNebelOS/refs/heads/main/00-signing-cachyos-kernel
#curl -sOL# https://raw.githubusercontent.com/zumnebeltech/ZumNebelOS/refs/heads/main/99-cachyos-default
#popd

#fish_config="
#if status is-interactive
#    set -U fish_greeting
#    # Commands to run in interactive sessions can go here
#    starship init fish | source
#    atuin init fish | source
#    zoxide init fish | source
#    direnv hook fish | source
#end
#"
#printf "%b" "${fish_config}" | tee

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
