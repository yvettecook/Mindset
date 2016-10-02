import UIKit
import ResearchKit


final class AppNavigator: NSObject, Navigator {

    let navigationController = UINavigationController()

    func toHome() {
        let homeViewController = HomeViewController.withDependencies()
        navigationController.setViewControllers([homeViewController], animated: true)
    }

    func toNewResponse() {
        let presenter = FormPresenter(
            displayer: self,
            service: LocalFormService(),
            layoutGenerator: ResearchKitFormGenerator(),
            navigator: self
        )

        guard
            let displayableForm = presenter.getDisplayableForm() as? ResearchKitForm
            else { fatalError("Cannot display this form") }

        let taskVC = ORKTaskViewController(task: displayableForm.orkTask, taskRun: nil)
        taskVC.delegate = self
        navigationController.pushViewController(taskVC, animated: true)
    }

}

extension AppNavigator: FormDisplayer {
    func display(form: DisplayableForm) {}
}

extension AppNavigator: ORKTaskViewControllerDelegate {

    public func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {}

}
