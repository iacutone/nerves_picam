# NervesPicam


_Build the firmware_
```
mix deps.get      # Fetch the dependencies
mix firmware      # Cross-compile dependencies and create a .fw file
mix firmware.burn # Burn firmware to an inserted SD card
```

_SSH_
`ssh target01@nerves.local`


__Reference__
1. https://github.com/elixir-vision/picam
2. https://github.com/nerves-project/nerves_init_gadget
3. https://github.com/pdgonzalez872/nerves_rpi3_wifi_picam

