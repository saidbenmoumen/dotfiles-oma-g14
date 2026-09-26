-- Extra autostart processes.
-- o.launch_on_start("my-service")
o.launch_on_start("rog-control-center")

-- DeckShift — restart xdg-desktop-portal stack after returning from Gaming Mode
o.launch_on_start("/usr/local/bin/deckshift-portal-recovery")
