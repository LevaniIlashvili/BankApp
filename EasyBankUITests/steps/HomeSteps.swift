import XCTest

class HomeSteps {
    private let homePage = HomePage()

    @discardableResult
    func validateIsOnHomeScreen() -> HomeSteps {
        XCTAssertTrue(homePage.sendMoneyButton.waitForExistence(timeout: 5.0))
        
        return self
    }

    @discardableResult
    func clickLogout() -> HomeSteps {
        let logoutBtn = homePage.logoutButton
        XCTAssertTrue(logoutBtn.waitForExistence(timeout: 5.0))
        logoutBtn.tap()

        return self
    }

    @discardableResult
    func confirmLogout() -> HomeSteps {
        let confirmBtn = homePage.confirmLogoutButton
        XCTAssertTrue(confirmBtn.waitForExistence(timeout: 5.0))
        confirmBtn.tap()

        return self
    }
}