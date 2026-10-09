import XCTest

final class BankingFlowTests: BaseClass {
    private let onboardingSteps = OnboardingSteps()
    private let loginSteps = LoginSteps()
    private let registrationSteps = RegistrationSteps()
    private let homeSteps = HomeSteps()
    
    func testInvalidEmailFormat() {
        onboardingSteps
            .goToLogin()

        loginSteps
            .fillEmail("invalid-email")
            .fillPassword("Paroli123.")
            .submitLogin()
            .validateErrorMessageContains("badly formatted")
    }

    func testUnregisteredUserLogin() {
        onboardingSteps
            .goToLogin()
        
        loginSteps
            .fillEmail("missing-user@example.com")
            .fillPassword("Paroli123.")
            .submitLogin()
            .validateErrorMessageContains("malformed or has expired") 
    }

    func testRegistrationAndReLogin() {
        let uniqueId = UUID().uuidString.prefix(8).lowercased()
        let testEmail = "auto_\(uniqueId)@easybank.test"
        
        let testPassword = "Paroli123."
        
        onboardingSteps.goToRegister()
        
        registrationSteps
            .fillEmail(testEmail)
            .fillPassword(testPassword)
            .fillRepeatPassword(testPassword)
            .submitRegistration()
        
        homeSteps
            .validateIsOnHomeScreen()
            .clickLogout()
            .confirmLogout()
        
        loginSteps
            .fillEmail(testEmail)
            .fillPassword(testPassword)
            .submitLogin()
        
        homeSteps.validateIsOnHomeScreen()
    }
}