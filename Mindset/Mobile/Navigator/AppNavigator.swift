import UIKit

final class AppNavigator: NSObject, Navigator {

    let navigationController = UINavigationController()

    func toHome() {
        let homeViewController = HomeViewController.withDependencies()
        navigationController.setViewControllers([homeViewController], animated: true)
    }

    func toNewRecord() {
        let recordViewController = RecordViewController()
        navigationController.pushViewController(recordViewController, animated: false)
    }


}

extension AppNavigator: FormDisplayer {
    func display(form: DisplayableForm) {}
}

