//
//  LoginViewController.swift
//  Personal Finance Manager
//
//  Created by RASHED on 7/2/24.
//

import UIKit

class LoginViewController: UIViewController {

    private var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        observeEvent()
    }
    
    func fetchData() {
        loginViewModel.fetchProducts()
    }

    func observeEvent() {
        loginViewModel.eventHandler = { [weak self] event in
            guard let self else { return }

            switch event {
            case .loading:
                print("Start loading....")
            case .stopLoading:
                // Indicator hide kardo
                print("Stop loading...")
            case .dataLoaded:
                print("Data loaded...")
                DispatchQueue.main.async {
                    // load table or data here mainly UI main
                }
            case .error(let error):
                print(error)
            }
        }
    }
}
