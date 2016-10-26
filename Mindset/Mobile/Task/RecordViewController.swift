import UIKit
import ResearchKit


class RecordViewController: UIViewController {

    var presenter: FormPresenter!

    init() {
        super.init(nibName: nil, bundle: nil)

        let presenter = FormPresenter(
            displayer: self,
            formService: LocalFormService(),
            recordService: PersistedRecordService(recordDatabase: RealmRecordDatabase()),
            layoutGenerator: ResearchKitFormGenerator(),
            navigator: SharedServices.navigator
        )

        self.presenter = presenter
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        presenter.startPresenting()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}

extension RecordViewController: FormDisplayer {

    func display(form: DisplayableForm) {
        guard
            let researchKitForm = form as? ResearchKitForm
            else {
                fatalError("ORKFormDisplayer needs a ResearchKitForm")
        }

        let taskVC = ORKTaskViewController(task: researchKitForm.orkTask, taskRun: nil)
        taskVC.delegate = self
        self.present(taskVC, animated: true)
    }
}

extension RecordViewController: ORKTaskViewControllerDelegate {

    public func taskViewController(_ taskViewController: ORKTaskViewController,
                                   didFinishWith reason: ORKTaskViewControllerFinishReason,
                                   error: Error?) {
        switch reason {
        case .saved:
            let taskResult = taskViewController.result
            let record = convertToRecordEntry(from: taskResult)
            presenter.userDidSave(record: record)
        case .discarded:
            presenter.userDidDiscardRecord()
        case.completed:
            let taskResult = taskViewController.result
            let record = convertToRecordEntry(from: taskResult)
            presenter.userDidComplete(record: record)
        case .failed:
            presenter.userDidFailedRecord()
        }

        self.dismiss(animated: true, completion: nil)
        SharedServices.navigator.navigationController.setNavigationBarHidden(false, animated: false)
        SharedServices.navigator.navigationController.popViewController(animated: false)
    }

}
