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
            .fillEmail(Constants.invalidEmail)
            .fillPassword(Constants.standardPassword)
            .submitLogin()
            .validateErrorMessageContains(Constants.errorBadlyFormatted)
    }

    func testUnregisteredUserLogin() {
        onboardingSteps
            .goToLogin()
        
        loginSteps
            .fillEmail(Constants.unregisteredEmail)
            .fillPassword(Constants.standardPassword)
            .submitLogin()
            .validateErrorMessageContains(Constants.errorMalformedOrExpired) 
    }

    func testRegistrationAndReLogin() {
        let uniqueId = UUID().uuidString.prefix(8).lowercased()
        let testEmail = "\(Constants.emailPrefix)\(uniqueId)\(Constants.emailDomain)"
        
        let testPassword = Constants.standardPassword
        
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