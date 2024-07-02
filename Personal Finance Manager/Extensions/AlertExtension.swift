//
//  AlertExtension.swift
//  Personal Finance Manager
//
//  Created by RASHED on 7/2/24.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlertWithActions(title: String?, message: String?, yesActionTitle: String, noActionTitle: String, yesHandler: @escaping () -> Void, noHandler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: yesActionTitle, style: .destructive) { _ in
            yesHandler()
        }
        
        let noAction = UIAlertAction(title: noActionTitle, style: .cancel) { _ in
            noHandler?()
        }
        
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
