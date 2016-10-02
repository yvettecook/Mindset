import UIKit

final class AppNavigator: Navigator {

    let navigationController = UINavigationController()

    func toHome() {
        let homeViewController = HomeViewController()
        navigationController.setViewControllers([homeViewController], animated: true)

    }
}
