/**************************************************************************
 name: sensing nano ble board
 coder: taewook kang
 date: 1/29/2021
 purpose: test
 **************************************************************************/

#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <Arduino_LSM9DS1.h>
#include <Arduino_HTS221.h>
#include <Arduino_LPS22HB.h>
#include <Arduino_APDS9960.h>

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 32 // OLED display height, in pixels

// Declaration for SSD1306 display connected using software SPI (default case):
#define OLED_RESET  -1
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

void initSensor()
{
  if (!APDS.begin()) {
    Serial.println("Error initializing APDS9960 sensor.");
    while (1); // Stop forever
  }
  
  if (!HTS.begin()) {
    Serial.println("Failed to initialize humidity temperature sensor!");
    while (1);
  }
  
  if (!IMU.begin()) {
    Serial.println("Failed to initialize IMU!");
    while (1);
  }

  if (!BARO.begin()) {
    Serial.println("Failed to initialize pressure sensor!");
    while (1);
  }
}

void setup() {
  Serial.begin(9600);
  Serial.println("Sensing");

  initSensor();

  Serial.print("Gyroscope sample rate = ");
  Serial.print(IMU.gyroscopeSampleRate());
  Serial.println(" Hz");
  Serial.println();
  Serial.println("Gyroscope in degrees/second");
  Serial.println("X\tY\tZ");  

  // SSD1306_SWITCHCAPVCC = generate display voltage from 3.3V internally
  if(!display.begin(SSD1306_SWITCHCAPVCC)) {
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); // Don't proceed, loop forever
  }

  // Show initial display buffer contents on the screen --
  // the library initializes this with an Adafruit splash screen.
  display.display();
  delay(1000); 

  // Clear the buffer
  display.clearDisplay();
  display.setTextSize(1); // Draw 2X-scale text
  display.setTextColor(SSD1306_WHITE);
  // display.setFont(ArialMT_Plain_10);

  testdrawline();      // Draw many lines
}

void loop() {
  sensingNano();    
}

void testdrawline() {
  int16_t i;
  display.clearDisplay(); // Clear display buffer

  for(i=0; i<display.width(); i+=4) {
    display.drawLine(0, 0, i, display.height()-1, SSD1306_WHITE);
    display.display(); // Update screen with each newly-drawn line
    delay(1);
  }
  for(i=0; i<display.height(); i+=4) {
    display.drawLine(0, 0, display.width()-1, i, SSD1306_WHITE);
    display.display();
    delay(1);
  }
  delay(250);
}

void sensingNano(void) {
  display.clearDisplay();
  initSensor();

  String data = "";
  float temperature = HTS.readTemperature();
  float humidity    = HTS.readHumidity();
  float pressure = BARO.readPressure();

  // print each of the sensor values
  Serial.print(temperature);
  Serial.print(", ");
  Serial.print(humidity);
  Serial.print(", ");
  Serial.print(pressure);
  
  display.setCursor(0, 0);
  data = String("THP: ") + String(temperature, 1) + ", " + String(humidity, 1) + ", " + String(pressure, 1);
  display.println(data);

  // light, RGB
  int proximity = 0;
  if (APDS.proximityAvailable()) {
      proximity = APDS.readProximity();
      Serial.print("pro ");
  }

  int r = 0, g = 0, b = 0;
  if (APDS.colorAvailable()) {
      APDS.readColor(r, g, b);
      Serial.print("color ");
  }

  // print each of the sensor values
  Serial.print(", ");  
  Serial.print(proximity);
  Serial.print(", ");
  Serial.print(r);
  Serial.print(", ");
  Serial.print(g);
  Serial.print(", ");
  Serial.print(b);

  display.setCursor(0, 8);
  data = String("L: ") + String(proximity, DEC) + ", " + String(r, DEC) + ", " + String(g, DEC) + ", " + String(b, DEC);
  display.println(data);
  
  float x, y, z;
  if (IMU.gyroscopeAvailable()) {
    IMU.readGyroscope(x, y, z);

    Serial.print(", ");
    Serial.print(x);
    Serial.print(", ");
    Serial.print(y);
    Serial.print(", ");
    Serial.print(z);

    display.setCursor(0, 16);
    String data = String("G: ") + String(x, 1) + ", " + String(y, 1) + ", " + String(z, 1);
    display.println(data);
  }

  if (IMU.accelerationAvailable()) {
    IMU.readAcceleration(x, y, z);

    Serial.print(", ");
    Serial.print(x);
    Serial.print(", ");
    Serial.print(y);
    Serial.print(", ");
    Serial.print(z);

    display.setCursor(0, 24);
    String data = String("A: ") + String(x, 1) + ", " + String(y, 1) + ", " + String(z, 1);
    display.println(data);    
  }

  if (IMU.magneticFieldAvailable()) {
    IMU.readMagneticField(x, y, z);

    Serial.print(", ");
    Serial.print(x);
    Serial.print(", ");
    Serial.print(y);
    Serial.print(", ");
    Serial.print(z);

    display.setCursor(0, 32);
    String data = String("M: ") + String(x, 1) + ", " + String(y, 1) + ", " + String(z, 1);
    display.println(data);       
  }

  Serial.println(" ");

  display.display();      // Show initial text
  delay(5000);
}
