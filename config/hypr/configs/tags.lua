-- configs/tags.lua
-- Documentation: https://hypr.land

-- 1. ASSIGN TAGS TO WINDOWS
-- Tag static identifiers for group rules
hl.window_rule({ match = { class = "^(discord|vesktop|org\\.telegram\\.desktop)$" }, tag = "chat" })
hl.window_rule({ match = { class = "^(kitty)$" }, tag = "terminals" })
hl.window_rule({ match = { class = "^(firefox|librewolf)$" }, tag = "browsers" })

-- 2. APPLY GLOBAL EFFECTS BY TAG NAME
-- Instead of repeating lines, rules apply instantly to the entire group tag
hl.window_rule({ match = { tag = "chat" }, opacity = "0.85 0.7" })
hl.window_rule({ match = { tag = "terminals" }, float = true })

