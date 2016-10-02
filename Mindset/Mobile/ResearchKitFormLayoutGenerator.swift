import Foundation

struct ResearchKitFormGenerator: FormLayoutGenerator {
    func prepareForDisplay(form: Form) -> DisplayableForm {
        print("PRINTING CBT FORM ...")
        return ResearchKitForm()
    }
}

struct ResearchKitForm: DisplayableForm {

}
