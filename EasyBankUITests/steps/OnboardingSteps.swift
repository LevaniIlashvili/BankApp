import XCTest

class OnboardingSteps {
    private let onboardingPage = OnboardingPage()

    @discardableResult
    func goToLogin() -> OnboardingSteps {
        let btn = onboardingPage.loginButton
        XCTAssertTrue(btn.waitForExistence(timeout: 5.0))
        btn.tap()

        return self
    }
    
    @discardableResult
    func goToRegister() -> OnboardingSteps {
        let btn = onboardingPage.registerButton
        XCTAssertTrue(btn.waitForExistence(timeout: 5.0))
        btn.tap()
        
        return self
    }
}