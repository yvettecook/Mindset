import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    static let navigator: Navigator = AppNavigator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        if let navigationController = (AppDelegate.navigator as? AppNavigator)?.navigationController {
            navigationController.pushViewController(HomeViewController.withDependencies(), animated: false)
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }

        return true
    }

}
