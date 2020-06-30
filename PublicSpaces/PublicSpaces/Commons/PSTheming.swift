//
//  PSTheming.swift
//  PublicSpaces
//
//  Created by Matthew Clark on 08/04/2020.
//  Copyright © 2020 Matthew Clark. All rights reserved.
//

import UIKit
import Foundation

struct PSFonts {
    static let psFontName                       = "MonumentGrotesk-Semi-Mono"
    static let psBtnFontSize                    = CGFloat(11.0)
}


struct PSAppTheming {
    static let psLabelTextColor                 = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
}

extension UIColor {
    
    public class var PSNormalBtnBackgroundColor: UIColor { return hexStringToUIColor(hex: "000000") }
    public class var PSSelectedBtnBackgroundColor: UIColor { return hexStringToUIColor(hex: "7EFF7E") }
    
    public class var PSNormalBtnTextColor: UIColor { return hexStringToUIColor(hex: "FFFFFF") }
    public class var PSSelectedBtnTxtColor: UIColor { return hexStringToUIColor(hex: "000000") }
    
    static func hexStringToUIColor (hex: String?) -> UIColor {
        guard let hexString = hex else {
            return .white
        }
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if cString.count != 6 {
            return .white
        }

        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
