-- Wayland backends
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("CLUTTER_BACKEND", "wayland")

-- Hardware acceleration in Electron apps
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
