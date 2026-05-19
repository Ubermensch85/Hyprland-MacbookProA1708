-- ~/.config/hypr/configs/execs.lua
-- MacBookPro14,1 — Hyprland 0.55

-- ── Variabili d'ambiente ─────────────────────────────────────────────────────
hl.env("LIBVA_DRIVER_NAME",  "iHD")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("XCURSOR_THEME",      "Bibata-Original-Classic")
hl.env("XCURSOR_SIZE",       "20")
hl.env("HYPRCURSOR_SIZE",    "20")

-- ── Autostart ────────────────────────────────────────────────────────────────
hl.on("hyprland.start", function()
    -- Ambiente e sessione
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user mask sleep.target suspend.target")

    -- Profilo colore display
    hl.exec_cmd("dispwin -L ~/.local/share/icc/macbook_retina.icc || dispwin ~/.local/share/icc/macbook_retina.icc")

    -- wob (on-screen display volume/luminosità)
    hl.exec_cmd("rm -f $XDG_RUNTIME_DIR/wob.wob && mkfifo $XDG_RUNTIME_DIR/wob.wob && tail -f $XDG_RUNTIME_DIR/wob.wob | wob")

    -- Monitor luminosità per wob
    hl.exec_cmd("~/.local/bin/brightness-monitor.sh")

    -- Notifiche
    hl.exec_cmd("mako")

    -- Foot daemon
    hl.exec_cmd("foot --server")

    -- Tastiera backlight
    hl.exec_cmd("/usr/local/bin/kbd-backlight.sh")

    -- Lid watcher
    hl.exec_cmd("~/.local/bin/lid-watcher.sh")

    -- Aggiornamenti in loop (ogni 15 minuti)
    hl.exec_cmd("bash -lc 'while :; do checkupdates >/dev/null 2>&1; sleep 900; done'")

    -- GTK settings
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme Adwaita")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'Jetbrains Mono 11'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface text-scaling-factor 1")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
    hl.exec_cmd("gsettings set org.cinnamon.desktop.default-applications.terminal exec footclient")

    -- Polkit
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

    -- Wallpaper e waybar dopo 500ms (monitor pronti)
    hl.timer(function()
        hl.exec_cmd("swaybg -i $HOME/Pictures/osxblue.jpg -m fill")
    end, { timeout = 500, type = "oneshot" })

    hl.timer(function()
        hl.exec_cmd("sh $HOME/scripts/waybar.sh")
    end, { timeout = 800, type = "oneshot" })
end)
