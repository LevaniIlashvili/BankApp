import XCTest

class OnboardingPage {
    let app = XCUIApplication()

    var registerButton: XCUIElement {
        return app.buttons["onboarding.register"]
    }

    var loginButton: XCUIElement {
        return app.buttons["onboarding.login"]
    }
}