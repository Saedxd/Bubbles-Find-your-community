import UIKit
import Flutter
import GoogleMaps
import Firebase
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
   GMSServices.provideAPIKey("AIzaSyDU_37KrySa8XKoPivA5jKvsuVGG5OVxW8")
    GeneratedPluginRegistrant.register(with: self)
    return true
  }
   override init() {
         // Firebase Init
         FirebaseApp.configure()
      }
}
