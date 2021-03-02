import Flutter
import UIKit

public class SwiftLauncherBadgePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "dev.britannio.launcher_badge", binaryMessenger: registrar.messenger())
        let instance = SwiftLauncherBadgePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "setBadgeCount":
            let count : Int = call.arguments as! Int;
            UIApplication.shared.applicationIconBadgeNumber = count
            result(nil)
            break
        case "getBadgeCount":
            result(UIApplication.shared.applicationIconBadgeNumber)
            break
        case "resetBadge":
            UIApplication.shared.applicationIconBadgeNumber = 0
            result(nil)
            break
        case "isSupported":
            // TODO check ios version
            result(true)
            break
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
