# FPGA Lab 2.2 — Four-LED Running Light

**Verilog · LED Control · Counters · One-Hot Rotation**

Former repository name: `FPGA2-2`.

A counter rotates a one-hot four-bit LED pattern using asynchronous active-high reset. 四位流水灯与分频计数实验。

[running_light.v](running_light.v) includes `running_light` and its original `tb_running_light` testbench. Reset selects `0001`; each counter rollover rotates the pattern through `0010`, `0100`, `1000`, and back to `0001`.

## Run

With Icarus Verilog installed:

```bash
mkdir -p build
iverilog -g2012 -s tb_running_light -o build/led.vvp running_light.v
vvp -n build/led.vvp
```

`CNT_MAX = 24_999_999` corresponds to one LED step per 0.5 seconds at 50 MHz. The original testbench resets after 30 milliseconds and ends after another 20 milliseconds, so it does **not** reach a default-count rotation. For a short waveform demonstration, override the parameter when compiling:

```bash
iverilog -g2012 -s tb_running_light -Ptb_running_light.uut.CNT_MAX=24 -o build/led_fast.vvp running_light.v
vvp -n build/led_fast.vvp
```

The source testbench has no assertions or waveform dump. Use a simulator viewer or add observation signals when investigating rotation timing. No FPGA pin constraints or measured board results are included.

[FPGA lab index](https://github.com/chengmiao2005/FPGA-Labs) · [Original-to-current file map](docs/FILE_MAP.md)

[Validation record](docs/VALIDATION.md)
