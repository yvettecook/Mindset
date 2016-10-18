import UIKit
import Realm
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let navigationController = SharedServices.navigator.navigationController
        navigationController.pushViewController(HomeViewController.withDependencies(), animated: false)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        let realm = try! Realm()

        let realmRecords = realm.objects(RealmRecordEntry.self)
        print("**********")
        print(realmRecords)
        print("**********")
        

        return true
    }

}
