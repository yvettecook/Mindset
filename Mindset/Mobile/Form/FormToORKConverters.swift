import ResearchKit

func formToORKOrderedTask(form: Form) -> ORKOrderedTask {

    var steps = [ORKStep]()

    let introStep = ORKInstructionStep(identifier: "intro")
    introStep.title = form.name

    steps.append(introStep)

    for step in form.steps {
        steps.append(stepToORKFormStep(step: step))
    }

    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Completed"

    steps.append(summaryStep)

    return ORKOrderedTask(identifier: form.id, steps: steps)
}

func stepToORKFormStep(step: Step) -> ORKFormStep {
    let question = ORKFormStep(identifier: step.id, title: step.title, text: step.prompt)

    var items = [ORKFormItem]()
    for item in step.items {
        items.append(itemToORKFormItem(item: item))
    }

    question.formItems = items

    return question

}

func itemToORKFormItem(item: Item) -> ORKFormItem {
    let formItem: ORKFormItem
    switch item.type {
    case .scale:
        formItem = ORKFormItem(identifier: item.id, text: "", answerFormat: ORKScaleAnswerFormat(maximumValue: 10, minimumValue: 0, defaultValue: 0, step: 1))
    case .text:
        formItem = ORKFormItem(identifier: item.id, text: "", answerFormat: ORKTextAnswerFormat())
    }
    return formItem
}

