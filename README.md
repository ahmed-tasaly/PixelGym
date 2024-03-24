# Pixel Gym

Aerobics with your camera. Easy, fast and free.

![alt screenshot](https://raw.githubusercontent.com/lrusso/PixelGym/main/README.png)

## Web

https://www.pixelgym.com

## Android App

https://play.google.com/store/apps/details?id=com.pixelgym

## iOS App

https://apps.apple.com/app/pixel-gym/id1611912403

## Debug mode

https://www.pixelgym.com/?debug=true

## Demo using the Debug mode

![alt demo](https://raw.githubusercontent.com/lrusso/PixelGym/main/README.gif)

## Banner Generator

https://www.pixelgym.com/Banner.htm

## Updating build numbers from the command line

* Update the ```VERSION_ANDROID``` file with the new ```Version Name``` for the Android App.
* Update the ```VERSION_IOS``` file with the new ```Marketing Version``` for the iOS App.
* Run the following commands:

```
chmod +x updateAndroid.sh
chmod +x updateiOS.sh

./updateAndroid.sh
./updateiOS.sh
```

## Motion detection logic based on the work of:

https://github.com/jasonmayes/JS-Motion-Detection

## Photos taken by Diana Grytsku and Arthur Bargan.

<!--

ffmpeg -i in.mp4 -filter:v "crop=1080:2030:0:110" -c:a copy out.mp4

-->
