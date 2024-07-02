//
//  DateExtension.swift
//  Personal Finance Manager
//
//  Created by RASHED on 7/1/24.
//

import Foundation
import UIKit


extension Date {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}

extension UITextField {
    func setCurrentDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        self.text = dateFormatter.string(from: Date())
    }
}

extension UITextField {
    func setCurrentTime() {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        self.text = timeFormatter.string(from: Date())
    }
}

