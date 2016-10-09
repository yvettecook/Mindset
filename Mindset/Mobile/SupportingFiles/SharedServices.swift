import Foundation

struct SharedServices {

    static let formService = LocalFormService()

    static let formLayoutGenerator = ResearchKitFormGenerator()

    static let navigator = AppNavigator()
}
