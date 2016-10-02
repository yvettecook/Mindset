import Foundation
import ResearchKit

struct ResearchKitFormGenerator: FormLayoutGenerator {
    func prepareForDisplay(form: Form) -> DisplayableForm {
        return ResearchKitForm(form: form)
    }
}

class ResearchKitForm: DisplayableForm {

    let orkTask: ORKOrderedTask

    init(form: Form) {
        self.orkTask = recordToORKOrderedTask(form: form)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

