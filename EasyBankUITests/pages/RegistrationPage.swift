import XCTest

class RegistrationPage {
    let app = XCUIApplication()

    var emailInput: XCUIElement { app.textFields["registration.email"] }
    var passwordInput: XCUIElement { app.secureTextFields["registration.password"] }
    var repeatPasswordInput: XCUIElement { app.secureTextFields["registration.repeatPassword"] }
    var submitButton: XCUIElement { app.buttons["registration.submit"] }
}