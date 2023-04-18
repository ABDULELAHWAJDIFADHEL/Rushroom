//
//  DIConfigurator.swift
//  Rush Rooms
//
//  Created by Kv on 29/03/22.
//

import Foundation
import UIKit

class DIConfigurator {
    
    private static let sharedOjbect = DIConfigurator()
    
    class func sharedInst() -> DIConfigurator {
        return sharedOjbect
    }
    
    // Method for get View Controller
    func getViewControler(_ storyBoard: StoryboardType, indentifier: String) -> UIViewController {
        let storyB = UIStoryboard(name: storyBoard.rawValue, bundle: nil)
        return storyB.instantiateViewController(withIdentifier: indentifier)
    }
    
    //MARK: - Tabbar
    //    func getTabbarViewC() -> TabbarViewC {
    //        let tabbarViewC = self.getViewControler(.Tabbar, indentifier: TabbarViewC.className) as! TabbarViewC
    //        return tabbarViewC
    //    }
    
    
    //MARK: - AUTH
    
    func getSplashScreenViewC() -> SplashScreenViewC {
        let splashScreenViewC = self.getViewControler(.Auth, indentifier: SplashScreenViewC.className) as! SplashScreenViewC
        return splashScreenViewC
    }
    
    func getWelcomeScreenViewC() -> WelcomeScreenViewC {
        let welcomeScreenViewC = self.getViewControler(.Auth, indentifier: WelcomeScreenViewC.className) as! WelcomeScreenViewC
        return welcomeScreenViewC
    }
    
    func getSignUpViewC() -> SignUpViewC {
        let signUpViewC = self.getViewControler(.Auth, indentifier: SignUpViewC.className) as! SignUpViewC
        return signUpViewC
    }
    
    func getSignUpAddInfoViewC() -> SignUpAddInfoViewC {
        let signUpAddInfoViewC = self.getViewControler(.Auth, indentifier: SignUpAddInfoViewC.className) as! SignUpAddInfoViewC
        return signUpAddInfoViewC
    }
    
    func getResetPasswordViewC() -> ResetPasswordViewC {
        let resetPasswordViewC = self.getViewControler(.Auth, indentifier: ResetPasswordViewC.className) as! ResetPasswordViewC
        return resetPasswordViewC
    }
    
    func getVerifyViewC() -> VerifyViewC {
        let verifyViewC = self.getViewControler(.Auth, indentifier: VerifyViewC.className) as! VerifyViewC
        return verifyViewC
    }
    
    func getForgotPasswordViewC() -> ForgotPasswordViewC {
        let forgotPasswordViewC = self.getViewControler(.Auth, indentifier: ForgotPasswordViewC.className) as! ForgotPasswordViewC
        return forgotPasswordViewC
    }
    
    func getLoginPhoneNoViewC() -> LoginPhoneNoViewC {
        let loginPhoneNoViewC = self.getViewControler(.Auth, indentifier: LoginPhoneNoViewC.className) as! LoginPhoneNoViewC
        return loginPhoneNoViewC
    }
    
    func getLoginEmailAndUserNameViewC() -> LoginEmailAndUserNameViewC {
        let loginEmailAndUserNameViewC = self.getViewControler(.Auth, indentifier: LoginEmailAndUserNameViewC.className) as! LoginEmailAndUserNameViewC
        return loginEmailAndUserNameViewC
    }
    
    func getOtpVerificationViewC() -> OtpVerificationViewC {
        let otpVerificationViewC = self.getViewControler(.Auth, indentifier: OtpVerificationViewC.className) as! OtpVerificationViewC
        return otpVerificationViewC
    }
    
    func getSkipViewC() -> SkipViewC {
        let skipViewC = self.getViewControler(.Auth, indentifier: SkipViewC.className) as! SkipViewC
        return skipViewC
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - HOME
    
    func getHomeViewC() -> HomeViewC {
        let homeViewC = self.getViewControler(.Home, indentifier: HomeViewC.className) as! HomeViewC
        return homeViewC
    }
    
    func getWishListViewC() -> WishListViewC {
        let wishListViewC = self.getViewControler(.Home, indentifier: WishListViewC.className) as! WishListViewC
        return wishListViewC
    }
    
    func getNotificationViewC() -> NotificationViewC {
        let notificationViewC = self.getViewControler(.Home, indentifier: NotificationViewC.className) as! NotificationViewC
        return notificationViewC
    }
    
    func getCategorieViewC() -> CategorieViewC {
        let categorieViewC = self.getViewControler(.Home, indentifier: CategorieViewC.className) as! CategorieViewC
        return categorieViewC
    }
    
    func getDateSelectionViewC() -> DateSelectionViewC {
        let dateSelectionViewC = self.getViewControler(.Home, indentifier: DateSelectionViewC.className) as! DateSelectionViewC
        return dateSelectionViewC
    }
    
    func getBookingSelectionViewC() -> BookingSelectionViewC {
        let bookingSelectionViewC = self.getViewControler(.Home, indentifier: BookingSelectionViewC.className) as! BookingSelectionViewC
        return bookingSelectionViewC
    }
    
    func getAddGuestAndRoomViewC() -> AddGuestAndRoomViewC {
        let addGuestAndRoomViewC = self.getViewControler(.Home, indentifier: AddGuestAndRoomViewC.className) as! AddGuestAndRoomViewC
        return addGuestAndRoomViewC
    }
    
    func getCityViewC() -> CityViewC {
        let cityViewC = self.getViewControler(.Home, indentifier: CityViewC.className) as! CityViewC
        return cityViewC
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - SETTING
    
    func getSideMenuViewC() -> SideMenuViewC {
        let sideMenuViewC = self.getViewControler(.Setting, indentifier: SideMenuViewC.className) as! SideMenuViewC
        return sideMenuViewC
    }
    
    func getProfileViewC() -> ProfileViewC {
        let profileViewC = self.getViewControler(.Setting, indentifier: ProfileViewC.className) as! ProfileViewC
        return profileViewC
    }
    
    func getChangePasswordViewC() -> ChangePasswordViewC {
        let changePasswordViewC = self.getViewControler(.Setting, indentifier: ChangePasswordViewC.className) as! ChangePasswordViewC
        return changePasswordViewC
    }
    
    func getWalletViewC() -> WalletViewC {
        let walletViewC = self.getViewControler(.Setting, indentifier: WalletViewC.className) as! WalletViewC
        return walletViewC
    }
    
    func getInviteFriendViewC() -> InviteFriendViewC {
        let inviteFriendViewC = self.getViewControler(.Setting, indentifier: InviteFriendViewC.className) as! InviteFriendViewC
        return inviteFriendViewC
    }
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - CHAT
    
    func getChatViewC() -> ChatViewC {
        let chatViewC = self.getViewControler(.Chat, indentifier: ChatViewC.className) as! ChatViewC
        return chatViewC
    }
    
    func getChatDetailViewC() -> ChatDetailViewC {
        let chatDetailViewC = self.getViewControler(.Chat, indentifier: ChatDetailViewC.className) as! ChatDetailViewC
        return chatDetailViewC
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - BOOKIGN
    func getBookingViewC() -> BookingViewC {
        let bookingViewC = self.getViewControler(.Booking, indentifier: BookingViewC.className) as! BookingViewC
        return bookingViewC
    }
    
    func getBookingHotelDetailViewC() -> BookingHotelDetailViewC {
        let bookingHotelDetailViewC = self.getViewControler(.Booking, indentifier: BookingHotelDetailViewC.className) as! BookingHotelDetailViewC
        return bookingHotelDetailViewC
    }
    
    func getCancelBookingPopViewC() -> CancelBookingPopViewC {
        let cancelBookingPopViewC = self.getViewControler(.Booking, indentifier: CancelBookingPopViewC.className) as! CancelBookingPopViewC
        return cancelBookingPopViewC
    }
    
    func getBookingHotelPendingViewC() -> BookingHotelPendingViewC {
        let bookingHotelPendingViewC = self.getViewControler(.Booking, indentifier: BookingHotelPendingViewC.className) as! BookingHotelPendingViewC
        return bookingHotelPendingViewC
    }
    
    func getCheckInViewC() -> CheckInViewC {
        let checkInViewC = self.getViewControler(.Booking, indentifier: CheckInViewC.className) as! CheckInViewC
        return checkInViewC
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - MAP
    
    func getMapViewC() -> MapViewC {
        let mapViewC = self.getViewControler(.Map, indentifier: MapViewC.className) as! MapViewC
        return mapViewC
    }
    
    
    
    
    
    
    
    //MARK: - FILTER LISTING
    
    func getFilterListingViewC() -> FilterListingViewC {
        let filterListingViewC = self.getViewControler(.FilterListing, indentifier: FilterListingViewC.className) as! FilterListingViewC
        return filterListingViewC
    }
    
    func getDirectionViewC() -> DirectionViewC {
        let directionViewC = self.getViewControler(.FilterListing, indentifier: DirectionViewC.className) as! DirectionViewC
        return directionViewC
    }
    
    func getSortByViewC() -> SortByViewC {
        let sortByViewC = self.getViewControler(.FilterListing, indentifier: SortByViewC.className) as! SortByViewC
        return sortByViewC
    }
    
    func getReviewListViewC() -> ReviewListViewC {
        let reviewListViewC = self.getViewControler(.FilterListing, indentifier: ReviewListViewC.className) as! ReviewListViewC
        return reviewListViewC
    }
    
    func getReviewViewC() -> ReviewViewC {
        let reviewViewC = self.getViewControler(.FilterListing, indentifier: ReviewViewC.className) as! ReviewViewC
        return reviewViewC
    }
    
    func getFilterViewC() -> FilterViewC {
        let filterViewC = self.getViewControler(.FilterListing, indentifier: FilterViewC.className) as! FilterViewC
        return filterViewC
    }
    
    func getHotelDetailViewC() -> HotelDetailViewC {
        let hotelDetailViewC = self.getViewControler(.FilterListing, indentifier: HotelDetailViewC.className) as! HotelDetailViewC
        return hotelDetailViewC
    }
    
    func getHotelBookingViewC() -> HotelBookingViewC {
        let hotelBookingViewC = self.getViewControler(.FilterListing, indentifier: HotelBookingViewC.className) as! HotelBookingViewC
        return hotelBookingViewC
    }
    
    func getPaymentSuccessViewC() -> PaymentSuccessViewC {
        let paymentSuccessViewC = self.getViewControler(.FilterListing, indentifier: PaymentSuccessViewC.className) as! PaymentSuccessViewC
        return paymentSuccessViewC
    }
    
    
    
    
    
    
    
    
    
    
    
    //method to make Root Controller
    func getRootViewC(_ storyBoard: StoryboardType, identifer:String) {
        let viewC = getViewControler(storyBoard, indentifier: identifer)
        let navigationController = UINavigationController(rootViewController: viewC)
        KEY_WINDOW.first?.rootViewController = navigationController
        KEY_WINDOW.first?.makeKeyAndVisible()
    }
    
    //MARK:- Alert ViewC
    //    func getCustomAlertViewC() -> CustomAlertViewC{
    //        let customAlertViewC = self.getViewControler(.Main, indentifier: CustomAlertViewC.className) as! CustomAlertViewC
    //        return customAlertViewC
    //    }
}

