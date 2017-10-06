////
///  AppDelegate.swift
//

import UIKit
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        let appController = UIViewController()
        window.rootViewController = appController
        window.makeKeyAndVisible()
        self.window = window

        sendClipboard()

        return true
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        sendClipboard()
    }

    func sendClipboard() {
        let pasteboardString: String? = UIPasteboard.general.string
        if let theString = pasteboardString {
            print("sending \"\(theString)\" to firebase")
        }
    }

}

