import Foundation

class FormPresenter {

    let displayer: FormDisplayer
    let formService: FormService
    let recordService: RecordService
    let layoutGenerator: FormLayoutGenerator

    let navigator: Navigator

    init(displayer: FormDisplayer,
         formService: FormService,
         recordService: RecordService,
         layoutGenerator: FormLayoutGenerator,
         navigator: Navigator) {
        self.displayer = displayer
        self.formService = formService
        self.recordService = recordService
        self.layoutGenerator = layoutGenerator
        self.navigator = navigator
    }


    func startPresenting() {
        let displayForm = getDisplayableForm()
        displayer.display(form: displayForm)
    }

    func stopPresenting() {}

    func getDisplayableForm() -> DisplayableForm {
        let form = formService.newCBTForm()
        return layoutGenerator.prepareForDisplay(form: form)
    }
}

extension FormPresenter: RecordActionListener {
    func userDidSave(record: RecordEntry) {
        recordService.save(record: record)
    }

    func userDidDiscardRecord() {
        recordService.discardRecord()
    }

    func userDidComplete(record: RecordEntry) {
        recordService.complete(record: record)
    }

    func userDidFailedRecord() {
        recordService.failedRecord()
    }
}

protocol FormLayoutGenerator {
    func prepareForDisplay(form: Form) -> DisplayableForm
}

protocol DisplayableForm {}

