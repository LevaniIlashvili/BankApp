import XCTest

class HomePage {
    let app = XCUIApplication()

    var sendMoneyButton: XCUIElement { app.buttons["home.sendMoney"] }
    var logoutButton: XCUIElement { app.buttons["home.logout"] }
    
    var logoutAlert: XCUIElement { app.alerts["Logging Out"] }
    var confirmLogoutButton: XCUIElement { logoutAlert.buttons["Yes"] }
}