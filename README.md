# Smart Thermostat

## Overview

The Smart Thermostat project utilizes an ESP32 microcontroller along with various sensors and actuators to create an intelligent heating, ventilation, and air conditioning (HVAC) control system. This project aims to provide an energy-efficient and user-friendly solution for maintaining indoor comfort levels.

## Features

- Real-time temperature and humidity monitoring
- Motion detection for occupancy sensing
- Automatic HVAC control based on environmental conditions
- Manual override functionality via a button interface
- OLED display for visual feedback and user interaction

## Hardware Requirements

- ESP32 microcontroller
- DHT22 temperature and humidity sensor
- PIR motion sensor
- Relay module for HVAC control
- OLED display
- Button for user input

## Installation

1. Connect the hardware components according to the wiring instructions.
2. Upload the provided Arduino code to the ESP32 microcontroller.
3. Install any necessary libraries (e.g., Adafruit_SSD1306, DHT) using the Arduino Library Manager.
4. Customize the code to adjust settings or thresholds as needed.
5. Power on the system and observe the functionality.

## Usage

1. Upon startup, the system will begin monitoring temperature, humidity, and motion.
2. The OLED display will show real-time temperature and humidity readings.
3. Motion detection triggers automatic control of the HVAC system based on temperature conditions.
4. Users can manually override the system by pressing the button to toggle the HVAC state.
5. Refer to the code comments for further customization options or advanced features.

## Contributing

Contributions to the project are welcome! If you'd like to contribute, please follow these guidelines:
- Fork the repository
- Create a new branch for your feature or bug fix
- Make your changes and test thoroughly
- Submit a pull request with a detailed description of your changes

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For questions, feedback, or support, please contact [Your Name](mailto:youremail@example.com).

