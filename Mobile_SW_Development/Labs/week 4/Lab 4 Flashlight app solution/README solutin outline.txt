
Lab 4 - Flashlight application
Solution outline

(1) In the manifest file - you have to declare all (both) activities .. in your app, 
and specify which one if the "launch" activity. So your manifest.xml file  will include statements
such as below .. using your own activity file names.

        <activity android:name=".RedFlashlightActivity"
                  android:label="@string/app_name">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
        <activity android:name=".GreenFlashlightActivity" android:label="@string/green_title" />
   
   
  (2) two xml layout files - that go in the res/layout directory
  (3) two activities (i.e. one per screen) - one for the red screen, one for the green_title.  Note the 
  "Intent" functionality in the callback onClick() method. 
  
  (4) colors.xml file - which goes in the res/values directory. This specifies the colour names as 
  central variables, rather then putting in hex codes scattered throughout your layout xml files.
    