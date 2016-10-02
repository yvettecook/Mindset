import Foundation

class FormPresenter {

    let displayer: FormDisplayer
    let service: FormService
    let layoutGenerator: FormLayoutGenerator

    let navigator: Navigator

    init(displayer: FormDisplayer,
         service: FormService,
         layoutGenerator: FormLayoutGenerator,
         navigator: Navigator) {
        self.displayer = displayer
        self.service = service
        self.layoutGenerator = layoutGenerator
        self.navigator = navigator
    }


    func startPresenting() {
        let displayForm = getDisplayableForm()
        displayer.display(form: displayForm)
    }

    func stopPresenting() {}

    func getDisplayableForm() -> DisplayableForm {
        let form = service.newCBTForm()
        return layoutGenerator.prepareForDisplay(form: form)
    }
}

extension FormPresenter: FormActionListener {
    func userDidSaveResponse() {}
    func userDidDiscardResponse() {}
    func userDidCompleteResponse() {}
    func userDidFailedResponse() {}
}

protocol FormLayoutGenerator {
    func prepareForDisplay(form: Form) -> DisplayableForm
}

protocol DisplayableForm {}

