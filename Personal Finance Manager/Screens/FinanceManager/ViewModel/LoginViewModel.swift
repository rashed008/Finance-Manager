//
//  LoginViewModel.swift
//  Personal Finance Manager
//
//  Created by RASHED on 7/2/24.
//

import Foundation

final class LoginViewModel {
    
    var login: [LoginModel] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchProducts() {
        self.eventHandler?(.loading)
        APIManager.shared.request(
            modelType: [LoginModel].self,
            type: LoginEndPoint.login) { response in
                self.eventHandler?(.stopLoading)
                switch response {
                case .success(let products):
                    self.login = self.login
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
                }
            }
    }
    
}

extension LoginViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
