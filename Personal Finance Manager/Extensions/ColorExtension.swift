import UIKit

extension UIColor {
    static let primaryColor = UIColor(named: "primary")
    static let main_color = UIColor(named: "main_color")
    
    static let secondary_color = UIColor(named: "secondary")
    static let text_primary_color = UIColor(named: "textPrimary_33_F2")
    
    static let placeholder_color = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1.0)
    
    
    
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


