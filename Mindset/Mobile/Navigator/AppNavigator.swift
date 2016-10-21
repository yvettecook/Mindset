import UIKit
import ResearchKit


final class AppNavigator: NSObject, Navigator {

    let navigationController = UINavigationController()

    func toHome() {
        let homeViewController = HomeViewController.withDependencies()
        navigationController.setViewControllers([homeViewController], animated: true)
    }

    func toNewRecord() {
        let presenter = FormPresenter(
            displayer: self,
            formService: LocalFormService(),
            recordService: PersistedRecordService(recordDatabase: RealmRecordDatabase()),
            layoutGenerator: ResearchKitFormGenerator(),
            navigator: self
        )

        guard
            let displayableForm = presenter.getDisplayableForm() as? ResearchKitForm
            else { fatalError("Cannot display this form") }

        let taskVC = ORKTaskViewController(task: displayableForm.orkTask, taskRun: nil)
        taskVC.delegate = self
        navigationController.present(taskVC, animated: true)

        self.presenter = presenter
    }

    var presenter: FormPresenter?

}

extension AppNavigator: FormDisplayer {
    func display(form: DisplayableForm) {}
}

extension AppNavigator: ORKTaskViewControllerDelegate {

    public func taskViewController(_ taskViewController: ORKTaskViewController,
                                   didFinishWith reason: ORKTaskViewControllerFinishReason,
                                   error: Error?) {
        guard let presenter = presenter else { fatalError() }
        switch reason {
        case .saved:
            let taskResult = taskViewController.result
            let record = convertToRecordEntry(from: taskResult)
            presenter.userDidSave(record: record)
        case .discarded:
            presenter.userDidDiscardRecord()
        case.completed:
            let taskResult = taskViewController.result
            print("=====")
            print(taskResult)
            print("=====")
            let record = convertToRecordEntry(from: taskResult)
            presenter.userDidComplete(record: record)
        case .failed:
            presenter.userDidFailedRecord()
        }

        navigationController.dismiss(animated: true, completion: nil)
    }

}
