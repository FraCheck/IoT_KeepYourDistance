<?xml version="1.0" encoding="UTF-8"?>

<simconf>

  <project EXPORT="discard">[APPS_DIR]/mrm</project>

  <project EXPORT="discard">[APPS_DIR]/mspsim</project>

  <project EXPORT="discard">[APPS_DIR]/avrora</project>

  <project EXPORT="discard">[APPS_DIR]/serial_socket</project>

  <project EXPORT="discard">[APPS_DIR]/collect-view</project>

  <project EXPORT="discard">[APPS_DIR]/powertracker</project>

  <simulation>

    <title>My simulation</title>

    <randomseed>123456</randomseed>

    <motedelay_us>1000000</motedelay_us>

    <radiomedium>

      org.contikios.cooja.radiomediums.UDGM

      <transmitting_range>50.0</transmitting_range>

      <interference_range>100.0</interference_range>

      <success_ratio_tx>1.0</success_ratio_tx>

      <success_ratio_rx>1.0</success_ratio_rx>

    </radiomedium>

    <events>

      <logoutput>40000</logoutput>

    </events>

    <motetype>

      org.contikios.cooja.mspmote.SkyMoteType

      <identifier>sky1</identifier>

      <description>Sky Mote Type #sky1</description>

      <firmware EXPORT="copy">[CONFIG_DIR]/build/telosb/main.exe</firmware>

      <moteinterface>org.contikios.cooja.interfaces.Position</moteinterface>

      <moteinterface>org.contikios.cooja.interfaces.RimeAddress</moteinterface>

      <moteinterface>org.contikios.cooja.interfaces.IPAddress</moteinterface>

      <moteinterface>org.contikios.cooja.interfaces.Mote2MoteRelations</moteinterface>

      <moteinterface>org.contikios.cooja.interfaces.MoteAttributes</moteinterface>

      <moteinterface>org.contikios.cooja.mspmote.interfaces.MspClock</moteinterface>

      <moteinterface>org.contikios.cooja.mspmote.interfaces.MspMoteID</moteinterface>

      <moteinterface>org.contikios.cooja.mspmote.interfaces.SkyButton</moteinterface>

      <moteinterface>org.contikios.cooja.mspmote.interfaces.SkyFlash</moteinterface>

      <moteinterface>org.contikios.cooja.mspmote.interfaces.SkyCoffeeFilesystem</moteinterface>

      <moteinterface>org.contikios.cooja.mspmote.interfaces.Msp802154Radio</moteinterface>

      <moteinterface>org.contikios.cooja.mspmote.interfaces.MspSerial</moteinterface>

      <moteinterface>org.contikios.cooja.mspmote.interfaces.SkyLED</moteinterface>

      <moteinterface>org.contikios.cooja.mspmote.interfaces.MspDebugOutput</moteinterface>

      <moteinterface>org.contikios.cooja.mspmote.interfaces.SkyTemperature</moteinterface>

    </motetype>

    <mote>

      <breakpoints />

      <interface_config>

        org.contikios.cooja.interfaces.Position

        <x>-49.46463870800585</x>

        <y>190.00869049832767</y>

        <z>0.0</z>

      </interface_config>

      <interface_config>

        org.contikios.cooja.mspmote.interfaces.MspClock

        <deviation>1.0</deviation>

      </interface_config>

      <interface_config>

        org.contikios.cooja.mspmote.interfaces.MspMoteID

        <id>1</id>

      </interface_config>

      <motetype_identifier>sky1</motetype_identifier>

    </mote>

    <mote>

      <breakpoints />

      <interface_config>

        org.contikios.cooja.interfaces.Position

        <x>168.52407693055062</x>

        <y>-261.2105247308227</y>

        <z>0.0</z>

      </interface_config>

      <interface_config>

        org.contikios.cooja.mspmote.interfaces.MspClock

        <deviation>1.0</deviation>

      </interface_config>

      <interface_config>

        org.contikios.cooja.mspmote.interfaces.MspMoteID

        <id>2</id>

      </interface_config>

      <motetype_identifier>sky1</motetype_identifier>

    </mote>

    <mote>

      <breakpoints />

      <interface_config>

        org.contikios.cooja.interfaces.Position

        <x>388.9728098575584</x>

        <y>42.419231808903476</y>

        <z>0.0</z>

      </interface_config>

      <interface_config>

        org.contikios.cooja.mspmote.interfaces.MspClock

        <deviation>1.0</deviation>

      </interface_config>

      <interface_config>

        org.contikios.cooja.mspmote.interfaces.MspMoteID

        <id>3</id>

      </interface_config>

      <motetype_identifier>sky1</motetype_identifier>

    </mote>

    <mote>

      <breakpoints />

      <interface_config>

        org.contikios.cooja.interfaces.Position

        <x>-255.82379738811005</x>

        <y>8.40670361172813</y>

        <z>0.0</z>

      </interface_config>

      <interface_config>

        org.contikios.cooja.mspmote.interfaces.MspClock

        <deviation>1.0</deviation>

      </interface_config>

      <interface_config>

        org.contikios.cooja.mspmote.interfaces.MspMoteID

        <id>4</id>

      </interface_config>

      <motetype_identifier>sky1</motetype_identifier>

    </mote>

    <mote>

      <breakpoints />

      <interface_config>

        org.contikios.cooja.interfaces.Position

        <x>222.92528065505056</x>

        <y>265.5434123529325</y>

        <z>0.0</z>

      </interface_config>

      <interface_config>

        org.contikios.cooja.mspmote.interfaces.MspClock

        <deviation>1.0</deviation>

      </interface_config>

      <interface_config>

        org.contikios.cooja.mspmote.interfaces.MspMoteID

        <id>5</id>

      </interface_config>

      <motetype_identifier>sky1</motetype_identifier>

    </mote>

    <mote>

      <breakpoints />

      <interface_config>

        org.contikios.cooja.interfaces.Position

        <x>153.19902980750223</x>

        <y>-273.89456899119426</y>

        <z>0.0</z>

      </interface_config>

      <interface_config>

        org.contikios.cooja.mspmote.interfaces.MspClock

        <deviation>1.0</deviation>

      </interface_config>

      <interface_config>

        org.contikios.cooja.mspmote.interfaces.MspMoteID

        <id>6</id>

      </interface_config>

      <motetype_identifier>sky1</motetype_identifier>

    </mote>

    <mote>

      <breakpoints />

      <interface_config>

        org.contikios.cooja.interfaces.Position

        <x>146.9213487391371</x>

        <y>-271.86878287291495</y>

        <z>0.0</z>

      </interface_config>

      <interface_config>

        org.contikios.cooja.mspmote.interfaces.MspClock

        <deviation>1.0</deviation>

      </interface_config>

      <interface_config>

        org.contikios.cooja.mspmote.interfaces.MspMoteID

        <id>7</id>

      </interface_config>

      <motetype_identifier>sky1</motetype_identifier>

    </mote>

  </simulation>

  <plugin>

    org.contikios.cooja.plugins.SimControl

    <width>280</width>

    <z>0</z>

    <height>160</height>

    <location_x>400</location_x>

    <location_y>0</location_y>

  </plugin>

  <plugin>

    org.contikios.cooja.plugins.Visualizer

    <plugin_config>

      <moterelations>true</moterelations>

      <skin>org.contikios.cooja.plugins.skins.IDVisualizerSkin</skin>

      <skin>org.contikios.cooja.plugins.skins.GridVisualizerSkin</skin>

      <skin>org.contikios.cooja.plugins.skins.TrafficVisualizerSkin</skin>

      <skin>org.contikios.cooja.plugins.skins.UDGMVisualizerSkin</skin>

      <viewport>0.3575486317821067 0.0 0.0 0.3575486317821067 204.11054196485682 194.9814672468626</viewport>

    </plugin_config>

    <width>400</width>

    <z>1</z>

    <height>400</height>

    <location_x>1</location_x>

    <location_y>1</location_y>

  </plugin>

  <plugin>

    org.contikios.cooja.plugins.LogListener

    <plugin_config>

      <filter />

      <formatted_time />

      <coloring />

    </plugin_config>

    <width>1392</width>

    <z>3</z>

    <height>452</height>

    <location_x>-783</location_x>

    <location_y>486</location_y>

  </plugin>

  <plugin>

    org.contikios.cooja.plugins.TimeLine

    <plugin_config>

      <mote>0</mote>

      <mote>1</mote>

      <mote>2</mote>

      <mote>3</mote>

      <mote>4</mote>

      <mote>5</mote>

      <mote>6</mote>

      <showRadioRXTX />

      <showRadioHW />

      <showLEDs />

      <zoomfactor>500.0</zoomfactor>

    </plugin_config>

    <width>1792</width>

    <z>9</z>

    <height>166</height>

    <location_x>0</location_x>

    <location_y>726</location_y>

  </plugin>

  <plugin>

    org.contikios.cooja.plugins.Notes

    <plugin_config>

      <notes>Enter notes here</notes>

      <decorations>true</decorations>

    </plugin_config>

    <width>1112</width>

    <z>4</z>

    <height>160</height>

    <location_x>680</location_x>

    <location_y>0</location_y>

  </plugin>

  <plugin>

    org.contikios.cooja.serialsocket.SerialSocketServer

    <mote_arg>0</mote_arg>

    <plugin_config>

      <port>60001</port>

      <bound>true</bound>

    </plugin_config>

    <width>362</width>

    <z>-1</z>

    <height>116</height>

    <location_x>430</location_x>

    <location_y>30</location_y>

    <minimized>true</minimized>

  </plugin>

  <plugin>

    org.contikios.cooja.serialsocket.SerialSocketServer

    <mote_arg>1</mote_arg>

    <plugin_config>

      <port>60002</port>

      <bound>true</bound>

    </plugin_config>

    <width>362</width>

    <z>8</z>

    <height>116</height>

    <location_x>406</location_x>

    <location_y>166</location_y>

  </plugin>

  <plugin>

    org.contikios.cooja.serialsocket.SerialSocketServer

    <mote_arg>2</mote_arg>

    <plugin_config>

      <port>60003</port>

      <bound>true</bound>

    </plugin_config>

    <width>362</width>

    <z>7</z>

    <height>116</height>

    <location_x>436</location_x>

    <location_y>196</location_y>

  </plugin>

  <plugin>

    org.contikios.cooja.serialsocket.SerialSocketServer

    <mote_arg>3</mote_arg>

    <plugin_config>

      <port>60004</port>

      <bound>true</bound>

    </plugin_config>

    <width>362</width>

    <z>6</z>

    <height>116</height>

    <location_x>410</location_x>

    <location_y>358</location_y>

  </plugin>

  <plugin>

    org.contikios.cooja.serialsocket.SerialSocketServer

    <mote_arg>4</mote_arg>

    <plugin_config>

      <port>60005</port>

      <bound>true</bound>

    </plugin_config>

    <width>362</width>

    <z>2</z>

    <height>116</height>

    <location_x>134</location_x>

    <location_y>250</location_y>

  </plugin>

  <plugin>

    org.contikios.cooja.serialsocket.SerialSocketServer

    <mote_arg>5</mote_arg>

    <plugin_config>

      <port>60006</port>

      <bound>true</bound>

    </plugin_config>

    <width>362</width>

    <z>5</z>

    <height>116</height>

    <location_x>406</location_x>

    <location_y>286</location_y>

  </plugin>

</simconf>