import UIKit

class HomeViewController: UIViewController {

    let homeView = HomeView()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        styleNavigationBar()
    }


    func styleNavigationBar() {
        addBarButtonItem()
    }

    func addBarButtonItem() {
        let newFormButton = homeView.newRecordBarButtonItem
        navigationItem.setRightBarButton(newFormButton, animated: false)
    }
}

