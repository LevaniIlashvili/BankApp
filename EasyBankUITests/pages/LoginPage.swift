import XCTest

class LoginPage {
    let app = XCUIApplication()

    var emailInput: XCUIElement {
        return app.textFields["login.email"]
    }
    
    var passwordInput: XCUIElement {
        return app.secureTextFields["login.password"]
    }
    
    var submitButton: XCUIElement {
        return app.buttons["login.submit"]
    }
    
    var errorLabel: XCUIElement {
        return app.staticTexts["login.error"]
    }
}