import Foundation

protocol FormDisplayer: class {
    func display(form: DisplayableForm)
    weak var actionListener: FormActionListener? { get set }
}
