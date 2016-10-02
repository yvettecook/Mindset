import UIKit

final class HomeView: UIView {


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
        SharedServices.navigator.toNewResponse()
    }
}


