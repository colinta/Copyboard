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

        checkClipboard()

        return true
    }

    func checkClipboard() {
        let ref = Database.database().reference().child("clipboard/send")
        ref.observeSingleEvent(of: .value) { snapshot, error in
            if let value = snapshot.value as? String {
                UIPasteboard.general.string = value
                ref.removeValue { _, _ in
                    exit(0)
                }
            }
            else {
                self.sendClipboard()
            }
        }
    }

    func sendClipboard() {
        let ref = Database.database().reference().child("clipboard/value")

        let pasteboardString: String? = UIPasteboard.general.string
        if let clipboard = pasteboardString {
            ref.setValue(clipboard, withCompletionBlock: { error, ref in
                exit(0)
            })
        }
    }

}
