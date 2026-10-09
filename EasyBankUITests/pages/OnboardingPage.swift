import XCTest

class OnboardingPage {
    let app = XCUIApplication()

    var loginButton: XCUIElement {
        return app.buttons["onboarding.login"]
    }
}