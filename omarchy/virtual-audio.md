# install pactl

```shell
sudo pacman -Fy pactl
```

To set up a virtual microphone on Arch Linux for use in Carla,
create a virtual audio source using PipeWire or PulseAudio commands.

## setup sink

```shell
pactl load-module module-null-sink sink_name=VirtualMic
```

## setup source_name

```shell
pactl load-module module-virtual-source source_name=VirtualMicSource master=VirtualMic.monitor
```

to create the input device, which can then be routed in Carla's Patchbay.
