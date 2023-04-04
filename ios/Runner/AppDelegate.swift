import UIKit
import Flutter
import GoogleMaps
import FirebaseCore

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    // Defind Google maps API KEY
    // AIzaSyDaILnZx_pfWHUTGYMLeKBpP5lq2GP8mYY
    GMSServices.provideAPIKey("AIzaSyDaILnZx_pfWHUTGYMLeKBpP5lq2GP8mYY")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
