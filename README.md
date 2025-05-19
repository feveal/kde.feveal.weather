# kde.feveal.weather (1.3)

This Plasmoid provides weather forecast on the image of an old barometer. The needle shows the temperature. The image also appears with the current prediction, temperature and other details. It also has an animated anemometer that rotates depending on the wind speed. By clicking on the image of current weather, the information for subsequent days appears and disappears. Likewise, the anemometer can be stopped by clicking on it. Shows the image of the moon with lighting data and others. By clicking with the mouse on different points in the image, these details are shown or hidden.
You can change the temperature units between Celsius, Fahrenheit and Kelvin. Also change the font size and color.

**NOTE:** Please note that all servers do not provide certain data, for example "wetter.com" does not provide current temperature or wind speed, therefore you will not see the current temperature data, the needle will not be visible, and the anemometer will not spin. If they are available for your location, use other servers such as BBC or NOAA.

## Screenshots
![](https://www.opencode.net/feveal/kde-feveal-weather/-/raw/main/Screenshot_baro.png)
-
![](https://www.opencode.net/feveal/kde-feveal-weather/-/raw/main/plasma_baro.mp4)
-

## Getting started:
1. **Unzip the downloaded archive.**
2. Inside the unzipped folder, locate the file: `install_plasmoid.sh`.
3. Give execute permissions for this file
4. Open a terminal in that folder and run:

   ```bash
   ./install_plasmoid.sh
   ```
5. The plasmoid will be installed to: ".local/share/plasma/plasmoids/kde.feveal.weather/"

Sometimes when resizing the plasmoid, the characters with the moon data do not appear correctly. Use the "restartplasma" file from the terminal by running "./restartplasma"

The Plasmoid is integrated  with the rest.

## Description:
Plasmoid for KDE Desktop

(Version 1.3) This version adds new icons that were missing for some weather servers. Also some servers add text strings to image names which caused the image not to be found, this problem has been fixed.
Some servers provide differentiated data between day and night. Some images
that used to appear with the sun at night have been added. Now they appear with the moon. 

(Version 1.2) This version fixes some minor bugs that appear on console. Also added a refresher for lunar data.

## Authors and acknowledgment:
Fernando Velez (feveal@hotmail.com), but using routines from other authors ( xyz.relativity@gmail.com , zrenfire@gmail.com ) 

## License:
For open source projects, say how it is licensed
