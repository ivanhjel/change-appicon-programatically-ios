# Change AppIcon Programatically

Change your app’s icon programmatically in iOS 10.3

With iOS 10.3, Apple added a new method, setAlternateIconName, that allows you to programmatically change your app icon. Rather than having to resubmit your app to the App Store for each change, you can now add alternate icons ahead of time, and switch between them using your code. However, per Apple's design docs, this change must be displayed and acknowledged by the user.

![2017-12-04 10_27_09](https://thumbs.gfycat.com/AshamedThriftyEmperorpenguin-size_restricted.gif)

**Add the name of your alternate icons in info.plist like this:**

```swift
<key>CFBundleIcons</key>
<dict>
  <key>CFBundleAlternateIcons</key>
  <dict>
    <key>Icon1</key>
    <dict>
      <key>CFBundleIconFiles</key>
      <array>
        <string>Icon1</string>
      </array>
    </dict>
    <key>Icon2</key>
    <dict>
      <key>CFBundleIconFiles</key>
      <array>
        <string>Icon2</string>
      </array>
    </dict>
    <key>Icon3</key>
    <dict>
      <key>CFBundleIconFiles</key>
      <array>
        <string>Icon3</string>
      </array>
    </dict>
    <key>Icon4</key>
    <dict>
      <key>CFBundleIconFiles</key>
      <array>
        <string>Icon4</string>
      </array>
    </dict>
    <key>Icon5</key>
    <dict>
      <key>CFBundleIconFiles</key>
      <array>
        <string>Icon5</string>
      </array>
    </dict>
  </dict>
</dict>
```


