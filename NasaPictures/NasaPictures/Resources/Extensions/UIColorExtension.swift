//
//  UIColorExtension.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit

extension UIColor {
    static var mainBackgroundColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ? UIColor(hex: "351206") : UIColor(hex: "ede1e1")
            }
        } else {
            return UIColor(hex: "F2F2F2")
        }
    }
    
    static var orange: UIColor {
        return UIColor(hex: "b2310f")
    }
    
    static var darkYellow: UIColor {
        return UIColor(hex: "e06810")
    }
    
    static var lightYellow: UIColor {
        return UIColor(hex: "fb9606")
    }
}


extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }

}

