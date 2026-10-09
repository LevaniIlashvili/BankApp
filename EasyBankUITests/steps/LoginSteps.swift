import XCTest

class LoginSteps {
    private let loginPage = LoginPage()

    @discardableResult
    func fillEmail(_ email: String) -> LoginSteps {
        let emailField = loginPage.emailInput
        XCTAssertTrue(emailField.waitForExistence(timeout: 5.0))
        emailField.tap()
        emailField.typeText(email)

        return self
    }

    @discardableResult
    func fillPassword(_ pass: String) -> LoginSteps {
        let passwordField = loginPage.passwordInput
        XCTAssertTrue(passwordField.waitForExistence(timeout: 5.0))
        passwordField.tap()
        passwordField.typeText(pass)

        return self
    }

    @discardableResult
    func submitLogin() -> LoginSteps {
        let submitBtn = loginPage.submitButton
        XCTAssertTrue(submitBtn.waitForExistence(timeout: 5.0))
        submitBtn.tap()

        return self
    }

    @discardableResult
    func validateErrorMessageContains(_ text: String) -> LoginSteps {
        let errorLabel = loginPage.errorLabel
        let isVisible = errorLabel.waitForExistence(timeout: 5.0)
        XCTAssertTrue(isVisible && errorLabel.label.lowercased().contains(text.lowercased()))
        
        return self
    }
}