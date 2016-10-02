import UIKit

final class AppNavigator: Navigator {

    let navigationController = UINavigationController()

    func toHome() {
        let homeViewController = HomeViewController()
        let homeViewController = HomeViewController.withDependencies()
        navigationController.setViewControllers([homeViewController], animated: true)

    }
}
