//
//  ConstantTexts.swift
//  Helper Class
//
//  Created by Kv on 29/03/22.
//

import Foundation

enum NavigationTitles: String{
    //LOGIN
    case login = "LOGIN"
    
    var localizedString:String {
        return NSLocalizedString(self.rawValue.localized(), comment: "")
    }
}

enum CommonTexts: String{
        
    case english                              =     "ENGLISH"
    case arabic                               =     "ARABIC"
    case usd                                  =     "USD"
    case rupees                               =     "RUPEES"
    
    
    case ok                                   =     "OK"
    case cancel                               =     "CANCEL"
    case selectDob                            =     "SELECT_DOB"
    case male                                 =     "MALE"
    case female                               =     "FEMALE"
    case other                                =     "OTHER"
    
    var localizedString:String {
        return NSLocalizedString(self.rawValue.localized(), comment: "")
    }
}

enum ErrorTexts: String {
    
    //ERROR MESSAGE
    case offLineInternet = "OFFILINE_INTERNET"
    case errorMessage = "ERROR_OCCURED"
    case error = "ERROR"
    case success = "SUCCESS"
    case warning = "WARNING"
    case alert = "ALERT"
    
    var localizedString:String {
        return NSLocalizedString(self.rawValue.localized(), comment: "")
    }
}


// MARK: - Constants texts

enum KStrings: String{
    
    //Language
    case languageTitle                        =    "LANGUAGE_TITLE"
    case languageSubTitle                     =    "LANGUAGE_SUB_TITLE"
    case confirm                              =    "CONFIRM"

    //Splash
    case splashTitleOne                       =    "SPLASH_TITLE_ONE"
    case splashTitleTwo                       =    "SPLASH_TITLE_TWO"
    case splashTitleThree                     =    "SPLASH_TITLE_THREE"
    case splashSubTitle                       =    "SPLASH_SUB_TITLE"
    
    //Welcome
    case letsGet                              =     "LETS_GET"
    case started                              =     "STARTED"
    case signUp                               =     "SIGN_UP"
    case alreadyHaveAccount                   =     "ALREADY_HAVE_ACCOUNT"
    case logIn                                =     "LOGIN"
    case welcomeSubTitle                      =     "WELCOME_SUB_TITLE"
    
    //SignUp
    case signUpPhoneNo                        =     "SIGN_UP_PHONE_NO"
    case signUpEmail                          =     "SIGN_UP_EMAIL"
    case signUpTitle                          =     "SIGN_UP_TITLE"
    case signUpSubTitle                       =     "SIGN_UP_SUB_TITLE"
    case continueBtn                          =     "CONTINUE_BTN"
    case countryCodeMsg                       =     "COUNTRY_CODE_MSG"
    case signUpAddInfoTitle                   =     "SIGN_UP_ADD_INFO_TITLE"
    
    //Reset password/ Forgot Password
    case resetPassword                        =     "RESET_PASSWORD"
    case reset                                =     "RESET"
    case verifyTitle                          =     "VERIFY_TITLE"
    case verifySubTitle                       =     "VERIFY_SUB_TITLE"
    case loginAgain                           =     "LOGIN_AGAIN"
    case forgotPassword                       =     "FORGOT_PASSWORD"
    case forgotSubTitleEmail                  =     "FORGOT_SUB_TITLE_EMAIL"
    case forgotSubTitlePhone                  =     "FORGOT_SUB_TITLE_PHONE"
    case resetViaEmail                        =     "RESET_VIA_EMAIL"
    case resetViaPhoneNo                      =     "RESET_VIA_PHONE_NO"
    case back                                 =     "BACK"
    case verifyFromChangePassword             =       "VERIFY_FROM_CHANGE_PASSWORD"
    
    //Login
    case loginTitle                           =     "LOGIN_TITLE"
    case loginViaEmailSubTitle                =     "LOGIN_VIA_EMAIL_SUB_TITLE"
    case loginViaPhoneSubTitle                =     "LOGIN_VIA_PHONE_SUB_TITLE"
    case loginViaUsernameSubTitle             =     "LOGIN_VIA_USERNAME_SUB_TITLE"
    case loginWithEmail                       =     "LOGIN_WITH_EMAIL"
    case loginWithPhoneNo                     =     "LOGIN_WITH_PHONE_NO"
    case loginWithUsername                    =     "LOGIN_WITH_USERNAME"
    case sendOtp                              =     "SEND_OTP"
    case SignUpSuccessFull                    =     "SIGN_UP_SUCCESSFULL"
    
    //OTP verification
    case submit                               =     "SUBMIT"
    case confirmEmail                         =     "CONFIRM_EMAIL"
    case confirmPhoneNo                       =     "CONFIRM_PHONE_NO"
    case resend                               =     "RESEND"
    case otpSubTitle                          =     "OTP_SUB_TITLE"
    case havenotRecivedCode                   =     "HAVE_NOT_RECIEVED_CODE"
    
    
    //Notification
    case muteNotification                     =     "MUTE_NOTIFICATION"
    case clearAll                             =     "CLEAR_ALL"
    
    
    //Home
    case hi                                   =     "HI"
    
    
    
    
    
    
    
    
    
    
    
    //Bookin
    case active                               =      "ACTIVE"
    case pending                              =      "PENDING"
    case cancelled                            =      "CANCELLED"
    case completed                            =      "COMPLETED"
    
    
    
    var localizedString: String {
        return NSLocalizedString(self.rawValue.localized(), comment: "")
    }
}


//MARK: - Placeholder message

enum PlaceholderTexts: String {
    //Sign Up
    case firstName                            =     "FIRST_NAME"
    case enterFirstName                       =     "ENTER_FIRST_NAME"
    case lastName                             =     "LAST_NAME"
    case enterLastName                        =     "ENTER_LAST_NAME"
    case mobileNumber                         =     "MOBILE_NUMBER"
    case enterMobileNumber                    =     "ENTER_MOBILE_NUMBER"
    case countryRegion                        =     "COUNTRY_REGION"
    
    //Sign Up add Info
    case email                                =     "EMAIL"
    case enterEmail                           =     "ENTER_EMAIL"
    case username                             =     "USERNAME"
    case enterUsername                        =     "ENTER_USERNAME"
    case dob                                  =     "DOB"
    case gender                               =     "GENDER"
    case password                             =     "PASSWORD"
    case enterPassword                        =     "ENTER_PASSWORD"
    case confirmPassword                      =     "CONFIRM_PASSWORD"
    case enterConfirmPassword                 =     "ENTER_CONFIRM_PASSWORD"
    
    //Change Password
    case currentPassword                      =     "CURRENT_PASSWORD"
    case enterCurrentPassword                 =     "ENTER_CURRENT_PASSWORD"
    case newPassword                          =     "NEW_PASSWORD"
    case enterNewPassword                     =     "ENTER_NEW_PASSWORD"
    
    //Profile
    case fullname                             =     "FULL_NAME"
    case enterFullName                        =     "ENTER_FULL_NAME"
    case nationality                          =     "NATIONALITY"
    case nationalIdNumber                     =     "NATIONAL_ID_NUMBER"
    case enterNationalIdNumber                =     "ENTER_NATIONAL_ID_NUMBER"
    case expiryDate                           =     "EXPIRY_DATE"
    case referalCode                          =     "REFERAL_CODE"
    case enterReferalCode                     =     "ENTER_REFERAL_CODE"
    
    
    var localizedString:String {
        return NSLocalizedString(self.rawValue.localized(), comment: "")
    }
}


// MARK: - Alert Messages
enum AlertsMsgs: String {
    
    //SignUp
    case emptyFirstName                        =     "EMPTY_FIRST_NAME"
    case emptyLastName                         =     "EMPTY_LAST_NAME"
    case emptyCountry                          =     "EMPTY_COUNTRY"
    case emptyPhoneNumber                      =     "EMPTY_PHONE_NUMBER"
    case emptyEmail                            =     "EMPTY_EMAIL"
    case invalidEmail                          =     "INVALID_EMAIL"
    case emptyUsername                         =     "EMPTY_USERNAME"
    case emptyDob                              =     "EMPTY_DOB"
    case emptyGender                           =     "EMPTY_GENDER"
    case emptypassword                         =     "EMPTY_PASSWORD"
    case invalidPassword                       =     "INVALID_PASSWORD"
    case emptyConfirmPassword                  =     "EMPTY_CONFIRM_PASSWORD"
    case invalidConfirmPassword                =     "INVALID_CONFIRM_PASSWORD"
    case unequalPasssword                      =     "UNEQUAL_PASSWORD"
    case emptyOtp                              =     "EMPTY_OTP"
    
    var localizedString:String {
        return NSLocalizedString(self.rawValue.localized(), comment: "")
    }
}

//MARK: - Alert String File for lottie
struct AlertString{
    static let success = "success"
    static let failure = "failure"
    static let error = "error"
    static let alert = "alert"
    static let internetError = "internetError"
}

//MARK: - Response String File

struct responseStrings{
    //LOGIN
    static let Login_Successfully   =   "Login Successfully"
}


//MARK: - Parameter Dictionary String File

struct passDicStrings{
    
    //SignUp && Login
    static let email                           =        "email"
    static let phoneNumber                     =        "phoneNumber"
    static let countryCode                     =        "countryCode"
    static let countryRegion                   =        "countryRegion"
    static let firstName                       =        "firstName"
    static let lastName                        =        "lastName"
    static let userName                        =        "userName"
    static let referralCode                    =        "referralCode"
    static let dob                             =        "dob"
    static let faceId                          =        "faceId"
    static let password                        =        "password"
    static let gender                          =        "gender"
    static let languageType                    =        "languageType"

}



