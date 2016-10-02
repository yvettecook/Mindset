import UIKit

final class HomeView: UIView {

    weak var actionListener: FormActionListener?

    let newRecordBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: nil, action: nil)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupHierarchy()
        setupLayout()

        newRecordBarButtonItem.target = self
        newRecordBarButtonItem.action = #selector(newRecord)
    }

    convenience init() {
        self.init(frame: CGRect.zero)

        setupViews()
        setupHierarchy()
        setupLayout()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .white
    }
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        
    }

    @objc private func newRecord() {

    }
    
}

extension HomeView: FormDisplayer {
    func display(form: DisplayableForm) {}

    // TODO: Should this be part of the protocol?
    func attach(actionListener: FormActionListener) {}
    func detach(actionListener: FormActionListener) {}
}

