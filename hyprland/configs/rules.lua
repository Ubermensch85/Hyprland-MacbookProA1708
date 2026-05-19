-- ~/.config/hypr/configs/rules.lua
-- MacBookPro14,1 — Hyprland 0.55
-- Static effects: float, tile, fullscreen, move, size, center, pin, workspace
-- Dynamic effects: opacity, border_color, border_size, rounding, no_focus, ...
-- size e move accettano tabelle: { 100, 200 }
-- "negative:PATTERN" nel match nega la regex

-- ── Dialog e finestre modali (globale) ───────────────────────────────────────
hl.window_rule({
    match  = { modal = true },
    float  = true,
    center = true,
})

-- ── fly-foot-write ───────────────────────────────────────────────────────────
hl.window_rule({
    match  = { title = "^(fly-foot-write)$" },
    float  = true,
    pin    = true,
    size   = { 858, 534 },
})

-- ── fly-foot-info (foot) ──────────────────────────────────────────────────────
hl.window_rule({
    match = { initial_class = "^(foot)$", initial_title = "^(fly-foot-info)$" },
    float = true,
    pin   = true,
    size  = { 900, 600 },
    move  = { "45%", "8%" },
})

-- ── fly-foot-info class diretta ───────────────────────────────────────────────
hl.window_rule({
    match  = { class = "^(fly-foot-info)$" },
    float  = true,
    size   = { 858, 534 },
    center = true,
})

-- ── Polkit ───────────────────────────────────────────────────────────────────
hl.window_rule({
    match = { class = "^(org.kde.polkit-kde-authentication-agent-1)$" },
    float = true,
})

-- ── Kitty su workspace 2 ─────────────────────────────────────────────────────
hl.window_rule({
    match = { class = "^(kitty)$", workspace = "2" },
    float = true,
    size  = { 700, 450 },
    move  = { 864, 80 },
})

-- ── XWayland drag fix ────────────────────────────────────────────────────────
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})
