#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <DHT.h>

// Pin definitions
#define DHTPIN 4    // DHT22 data pin
#define DHTTYPE DHT22
#define PIRPIN 5    // PIR sensor pin
#define RELAYPIN 18 // Relay control pin
#define BUTTONPIN 19 // Button pin

// Display settings
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels
#define OLED_RESET -1    // Reset pin # (or -1 if sharing Arduino reset pin)

// Initialize the OLED display using I2C
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

// Initialize DHT sensor
DHT dht(DHTPIN, DHTTYPE);

void setup() {
  // Initialize serial communication
  Serial.begin(115200);
  
  // Initialize OLED display
  if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    Serial.println(F("SSD1306 allocation failed"));
    for(;;);
  }
  
  // Initialize DHT sensor
  dht.begin();
  
  // Initialize PIR sensor pin
  pinMode(PIRPIN, INPUT);
  
  // Initialize relay pin
  pinMode(RELAYPIN, OUTPUT);
  digitalWrite(RELAYPIN, LOW);
  
  // Initialize button pin
  pinMode(BUTTONPIN, INPUT_PULLUP);
}

void loop() {
  // Read sensor data
  float temperature = dht.readTemperature(); // Temperature in Celsius
  float humidity = dht.readHumidity();       // Relative humidity
  
  // Display sensor data on OLED display
  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE);
  display.setCursor(0,0);
  display.println("Temperature:");
  display.print(temperature);
  display.println(" C");
  display.println("Humidity:");
  display.print(humidity);
  display.println(" %");
  display.display();
  
  // Read PIR sensor state
  int motion = digitalRead(PIRPIN);
  
  // If motion detected, turn on relay
  if(motion == HIGH) {
    digitalWrite(RELAYPIN, HIGH);
  }
  else {
    digitalWrite(RELAYPIN, LOW);
  }
  
  // Check button state
  int buttonState = digitalRead(BUTTONPIN);
  
  // If button is pressed, toggle relay
  if(buttonState == LOW) {
    digitalWrite(RELAYPIN, !digitalRead(RELAYPIN));
    delay(500); // Button debounce delay
  }
  
  delay(2000); // Wait for 2 seconds before repeating
}
