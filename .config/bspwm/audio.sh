pacat -r --latency-msec=2 -d alsa_input.usb-MICE_MICROPHONE_USB_MICROPHONE_201308-00.mono-fallback --property=Description=HI | pacat -p --latency-msec=2 -d alsa_output.pci-0000_00_1f.3.analog-stereo --property=Description=HI