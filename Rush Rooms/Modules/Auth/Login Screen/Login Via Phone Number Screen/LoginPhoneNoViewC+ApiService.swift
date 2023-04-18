//
//  LoginPhoneNoViewC+ApiService.swift
//  Rush Rooms
//
//  Created by Kv on 15/03/23.
//

import Foundation
import UIKit

extension LoginPhoneNoViewC{
    //Bind Function
    func bindLoginModel() {
        viewModel.signModel.bind { [weak self] observable, SignUpData in
            DispatchQueue.main.async {
                self?.signModel = SignUpData
                if self?.signModel?.code == 200{
                    APPLICATION_TYPE = ApplicationTypeEnum.login.rawValue
                    print(self?.signModel?.message ?? EMPTY)
                    self?.GoToVerification()
                } else {
                    self?.show_Alert(message: self?.signModel?.message ?? EMPTY)
                }
            }
        }
    }
}

class LoginViaPhoneViewModel: NSObject {
    
    // MARK: - All Properties
    var sessionProvider:URLSessionProvider!
    var isGotResponse: Observable<Bool> = Observable()
    var signModel : Observable<SignModel> = Observable()
    
    override init() {
        super.init()
        let session = URLSession.init(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        sessionProvider = URLSessionProvider.init(session: session)
    }
    
    func checkUser(params: [String:Any]) {
        let service = AuthService.checkUser(params: params)
        UtilityHelper.sharedInstance.showActivityIndicator()
        sessionProvider.request(type: SignModel.self,service: service) { [weak self] response in
            UtilityHelper.sharedInstance.hideActivityIndicator()
            guard let self = self else {return}
            switch response {
            case .success(let any):
                self.signModel.value = any
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension LoginViaPhoneViewModel: URLSessionDelegate{
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void){
        self.sessionProvider.urlSession(session, didReceive: challenge) { authChallengeDisposition, crdential in
            completionHandler(authChallengeDisposition,crdential)
        }
    }
}
