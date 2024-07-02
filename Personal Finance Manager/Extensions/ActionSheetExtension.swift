//
//  ActionSheetExtension.swift
//  Personal Finance Manager
//
//  Created by RASHED on 6/30/24.
//

import UIKit

extension UIViewController {
    func showFilterActionSheet(completion: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: "Select a filter", message: nil, preferredStyle: .actionSheet)
        
        let overallAction = UIAlertAction(title: "Overall", style: .default) { _ in
            completion("Overall")
        }
        
        let last7DaysAction = UIAlertAction(title: "Last 7 days", style: .default) { _ in
            completion("Last 7 days")
        }
        
        let last30DaysAction = UIAlertAction(title: "Last 30 days", style: .default) { _ in
            completion("Last 30 days")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(overallAction)
        alertController.addAction(last7DaysAction)
        alertController.addAction(last30DaysAction)
        alertController.addAction(cancelAction)
        
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
}

