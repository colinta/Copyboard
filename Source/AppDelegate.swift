////
///  AppDelegate.swift
//

import UIKit
import Firebase
import FirebaseDatabase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()

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
        let ref = Database.database().reference()

        let pasteboardString: String? = UIPasteboard.general.string
        if let clipboard = pasteboardString {
            ref.child("clipboard").setValue(["value": clipboard])
        }
    }

}

