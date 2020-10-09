# Nexys A7 Hardware Repository

This repository contains Vivado projects for all demos for the Nexys A7.

For more information about the Nexys A7, visit its [Resource Center](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/start) on the Digilent Wiki.

Each demo contained in this repository is documented on the Digilent Wiki, links in the table below.

| Wiki Link | Description |
|-----------|-------------|
| [Nexys A7 General Purpose I/O Demo](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/demos/gpio) | A hardware-only project that uses the Nexys A7's switches, LEDs, RGB LED's, pushbuttons, seven-segment display, PWM audio output, PDM microphone and USB UART bridge |
| [Nexys A7 Out-of-Box Demo](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/demos/oob) | A hardware-only project that uses the Nexys A7's switches, LEDs, pushbuttons, RGB LEDS, seven-segment display, VGA connector, USB HID Host port, PWM audio output, PDM microphone, 3-axis accelerometer and the temperature sensor |
| [Nexys A7 XADC Analog to Digital Converter Demo](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/demos/xadc) | A hardware-only project that uses the Nexys A7's analog-to-digital converter ciruitry, switches, LEDs, and seven-segment display |
| [Nexys A7 Keyboard Demo](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/demos/keyboard) | When a keyboard button is pressed/released, the value of the scan code will be converted to ASCII and transmitted to the terminal |
| [Nexys A7 DMA-Audio Demo](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/demos/dma-audio) | This project demonstrates how to stream data in and out of the Nexys A7's RAM |

## Repository Description

This repository contains the Vivado projects and hardware designs for all of the demos that we provide for the Nexys A7. As some demos also require software sources contained in Vitis workspaces, this repository should not be used directly. The [Nexys A7](https://github.com/Digilent/Nexys-A7) repository contains all sources for these demos across all tools, and pulls in all of this repository's sources by using it as a submodule.

For instructions on how to use this repository with git, and for additional documentation on the submodule and branch structures used, please visit [Digilent FPGA Demo Git Repositories](https://reference.digilentinc.com/reference/programmable-logic/documents/git) on the Digilent Wiki. Note that use of git is not required to use this demo. Digilent recommends the use of project releases, for which instructions can be found in each demo wiki page, linked in the table of demos, above.

Demos were moved into this repository during 2020.1 updates. History of these demos prior to these updates can be found in their old repositories, linked below:
* https://github.com/Digilent/Nexys-A7-50T-GPIO
* https://github.com/Digilent/Nexys-A7-100T-GPIO
* https://github.com/Digilent/Nexys-A7-50T-OOB
* https://github.com/Digilent/Nexys-A7-100T-OOB
* https://github.com/Digilent/Nexys-A7-50T-XADC
* https://github.com/Digilent/Nexys-A7-100T-XADC
* https://github.com/Digilent/Nexys-A7-50T-Keyboard
* https://github.com/Digilent/Nexys-A7-100T-Keyboard
* https://github.com/Digilent/Nexys-A7-50T-DMA-Audio
* https://github.com/Digilent/Nexys-A7-100T-DMA-Audio