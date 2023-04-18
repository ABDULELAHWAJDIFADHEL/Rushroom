//
//  LoginEmailAndUserNameViewC+ApiService.swift
//  Rush Rooms
//
//  Created by Kv on 15/03/23.
//

import Foundation
import UIKit

extension LoginEmailAndUserNameViewC{
    //Bind Function
    func bindLoginModel() {
        viewModel.loginModel.bind { [weak self] observable, LoginData in
            DispatchQueue.main.async {
                self?.loginModel = LoginData
                if self?.loginModel?.code == 200{
                    APPLICATION_TYPE = ApplicationTypeEnum.login.rawValue
                    print(self?.loginModel?.message ?? EMPTY)
                    self?.setUpLoginData()
                } else {
                    self?.show_Alert(message: self?.loginModel?.message ?? EMPTY)
                }
            }
        }
    }
    
    func setUpLoginData(){
        let login = self.loginModel?.activeUser
        USER_DEFAULTS.set(login?.email ?? EMPTY, forKey: UD.email)
        USER_DEFAULTS.set(login?.phoneNumber ?? EMPTY, forKey: UD.phoneNumber)
        USER_DEFAULTS.set(login?.countryCode ?? EMPTY, forKey: UD.countryCode)
        USER_DEFAULTS.set(login?.firstName ?? EMPTY, forKey: UD.firstName)
        USER_DEFAULTS.set(login?.lastName ?? EMPTY, forKey: UD.lastName)
        USER_DEFAULTS.set(login?.dob ?? EMPTY, forKey: UD.dob)
        USER_DEFAULTS.set(login?.profilePic ?? EMPTY, forKey: UD.profilePic)
        Root.Home()
    }
}

class LoginViewModel: NSObject {
    
    // MARK: - All Properties
    var sessionProvider:URLSessionProvider!
    var isGotResponse: Observable<Bool> = Observable()
    var loginModel : Observable<LoginModel> = Observable()
    
    override init() {
        super.init()
        let session = URLSession.init(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        sessionProvider = URLSessionProvider.init(session: session)
    }
    
    func LoginUser(params: [String:Any]) {
        let service = AuthService.userlogin(params: params)
        UtilityHelper.sharedInstance.showActivityIndicator()
        sessionProvider.request(type: LoginModel.self,service: service) { [weak self] response in
            UtilityHelper.sharedInstance.hideActivityIndicator()
            guard let self = self else {return}
            switch response {
            case .success(let any):
                self.loginModel.value = any
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension LoginViewModel: URLSessionDelegate{
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void){
        self.sessionProvider.urlSession(session, didReceive: challenge) { authChallengeDisposition, crdential in
            completionHandler(authChallengeDisposition,crdential)
        }
    }
}
