#include <SPI.h>
#include <boards.h>
#include <RBL_nRF8001.h>

void setup()
{
  // set up your BLE shield name, max length 10 characters
  ble_set_name("");
  
  // initialize the BLE library
  ble_begin();
}

void loop()
{
  // repeatedly send a space character from the BLE shield so that 
  // your iOS or Android app has a signal to receive - this signal
  // is used to determine proximity
  ble_write(' ');
    
  // allow BLE shield to send/receive data
  ble_do_events();
  
  delay(250);
}