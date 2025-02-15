//
//  ControllerExtension.swift
//  Personal Finance Manager
//
//  Created by RASHED on 6/30/24.
//


import UIKit

extension UIViewController {
    func push(from storyboardName: String, identifier: String, animated: Bool = true) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        navigationController?.pushViewController(viewController, animated: animated)
    }
}

extension UIViewController {
    func push(from storyboard: Storyboard, identifier: ViewControllerIdentifier) {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: identifier.rawValue) as? ChartViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}


extension UIViewController {
    func push<T: UIViewController>(
        from storyboardName: String,
        identifier: String,
        animated: Bool = true,
        configure: ((T) -> Void)? = nil
    ) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            print("ViewController with ID \(identifier) not found in storyboard \(storyboardName) or type mismatch.")
            return
        }
        configure?(viewController)
        navigationController?.pushViewController(viewController, animated: animated)
    }
}

