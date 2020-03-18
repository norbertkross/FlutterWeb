class SampleForExample{
static String md =
"""


![youtube](http://www.youtube.com/watch?v=6YbBmqUnoQM)

# Making a Todo App with Flutter

![Emulator Picture](https://miro.medium.com/max/1875/1*517hQ_LDC3d4F1wWfRQr5g.png)




Flutter is Google’s answer to React Native, allowing developers to create native apps for both Android and iOS. Unlike React Native, which is written in JSX, Flutter apps are written in Google’s Dart language.
Flutter is still in technically in beta, but its tools are quite stable, and provide a smooth development experience.
In this post I’ll explain how to create a simple todo app using Flutter.



# Install the tools

> These instructions are written for MacOS and Linux. Windows requires some extra prerequisites, so follow the Flutter Windows guide, and then move on to the next section, Create an app.


First, download the [Flutter SDK](https://flutter.dev) for your platform. For this app, we will create a directory called `dev` in our home directory, and unzip the Flutter SDK there.



```
mkdir ~/dev
cd ~/dev
unzip ~/Downloads/flutter_macos_v0.3.2-beta.zip
```




Now we can run Flutter on the command line by running `~/dev/flutter/bin/flutter`. That's a bit awkward to type, so let's add this directory to our `\$PATH` to make the command shorter. Add this line at the end of your `~/.bashrc` file.

```
export PATH=~/dev/flutter/bin:\$PATH
```

![Emulator With Keyboard](https://miro.medium.com/max/445/1*bV3Viw7sWVLDhbaKasHpZA.png)

Then run source `~/.bashrc` to ensure that this change takes effect. Now you can run `flutter` straight from the command line. Once this is set up, we need to check to ensure that we have installed everything else we need for app development, such as Android Studio, Xcode (only on MacOS), and other dependencies. Luckily, Flutter comes with a tool that makes it really easy to check this. Just run:



```
flutter doctor
```


![Two Emulators](https://miro.medium.com/max/790/1*ebJQyqOKcyHOKFObqTXN8A.png)
This will tell you exactly what needs to be installed so that Flutter will run correctly. Follow the doctor’s instructions, and make sure that everything is set up correctly before moving on to the next step.




# Create an app

We will create our app and test it on Android since this can be done on all operating systems, but all these steps will work just the same for iOS.
Flutter offers plugins for several IDEs, including Android Studio and Visual Studio Code. However, for our basic app, we can do everything using the command line and a simple text editor. First, let’s create our app, which we will call `flutter_todo` .










""";

}