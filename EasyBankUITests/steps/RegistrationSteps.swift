import XCTest

class RegistrationSteps {
    private let registrationPage = RegistrationPage()

    @discardableResult
    func fillEmail(_ email: String) -> RegistrationSteps {
        let emailField = registrationPage.emailInput
        XCTAssertTrue(emailField.waitForExistence(timeout: 5.0))
        emailField.tap()
        emailField.typeText(email)

        return self
    }

    @discardableResult
    func fillPassword(_ pass: String) -> RegistrationSteps {
        let passwordField = registrationPage.passwordInput
        XCTAssertTrue(passwordField.waitForExistence(timeout: 5.0))
        passwordField.tap()
        passwordField.typeText(pass)

        let closeButton = XCUIApplication().buttons["Close"]
        if closeButton.waitForExistence(timeout: 2.0) {
            closeButton.tap()
            passwordField.tap()
        }
        
        passwordField.typeText(pass)

        return self
    }
    
    @discardableResult
    func fillRepeatPassword(_ pass: String) -> RegistrationSteps {
        let repeatPasswordField = registrationPage.repeatPasswordInput
        XCTAssertTrue(repeatPasswordField.waitForExistence(timeout: 5.0))
        repeatPasswordField.tap()
        repeatPasswordField.typeText(pass)

        let closeButton = XCUIApplication().buttons["Close"]
        if closeButton.waitForExistence(timeout: 2.0) {
            closeButton.tap()
            repeatPasswordField.tap()
        }
        
        repeatPasswordField.typeText(pass)

        return self
    }

    @discardableResult
    func submitRegistration() -> RegistrationSteps {
        let submitBtn = registrationPage.submitButton
        XCTAssertTrue(submitBtn.waitForExistence(timeout: 5.0))
        submitBtn.tap()

        return self
    }
}