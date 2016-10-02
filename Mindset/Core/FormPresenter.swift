import Foundation

class FormPresenter {
    let displayer: FormDisplayer
    let database: FormDatabase
    let layoutGenerator: FormLayoutGenerator

    init(displayer: FormDisplayer, database: FormDatabase, layoutGenerator: FormLayoutGenerator) {
        self.displayer = displayer
        self.database = database
        self.layoutGenerator = layoutGenerator
    }


    func startPresenting() {
        let displayForm = getDisplayableForm()
        displayer.display(form: displayForm)
    }

    func stopPresenting() {}

    func getDisplayableForm() -> DisplayableForm {
        let form = database.form(ofType: .thoughtRecord)
        return layoutGenerator.prepareForDisplay(form: form)
    }
}

protocol FormLayoutGenerator {
    func prepareForDisplay(form: Form) -> DisplayableForm
}

protocol DisplayableForm {}
