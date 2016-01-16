# lablablab
Lablablab is an iOS app developed for CIU196: Mobile Computing by Alma Castillo, Adam Dunford & Fran Perković

## Live vs Test Data
If you want to view a prepopulated scenario, with groups already loaded, comment out this line in your **AppDelegate.swift** file 

```
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
  ⋮
  ⋮
//        Application.application.test()
```

## Simulating Multiple Users
Because this app requires students and teachers to operate, it can be somewhat annoying to switch from simulator to simulator (or run on two computers) if you're testing alone.

However, [per this awesome post](http://stackoverflow.com/a/26446438), we can run two simulators simultaneously (using Xcode 7):

```
cd /Applications/Xcode.app/Contents/Developer/Applications
open -n Simulator.app
open -n Simulator.app
```

When you open the second simulator, you'll get an error message which you can dismiss. You will also likely need to run two separate devices, which you can select from the **Hardware > Device** menu. Oh, and before you load them, make sure you've compiled your code for both devices in Xcode.
