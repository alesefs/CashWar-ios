//
//  Utils.swift
//  Cash War
//
//  Created by Alessandro Emanuel Ferreira de Souza on 11/06/24.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

extension Color {
    static let money1Light = Color(hex: 0xA5D6A7, opacity: 1.0)
    static let money1Dark = Color(hex: 0x388E3C, opacity: 1.0)
    
    static let money2Light = Color(hex: 0xC9D5DF, opacity: 1.0)
    static let money2Dark = Color(hex: 0x6A8CA8, opacity: 1.0)
    
    static let money5Light = Color(hex: 0xDCCFDA, opacity: 1.0)
    static let money5Dark = Color(hex: 0xB59AA5, opacity: 1.0)
    
    static let money10Light = Color(hex: 0xECCCD5, opacity: 1.0)
    static let money10Dark = Color(hex: 0xBB667C, opacity: 1.0)
    
    static let money20Light = Color(hex: 0xECE2C3, opacity: 1.0)
    static let money20Dark = Color(hex: 0xC1B594, opacity: 1.0)
    
    static let money50Light = Color(hex: 0xECDCD2, opacity: 1.0)
    static let money50Dark = Color(hex: 0xE3B396, opacity: 1.0)
    
    static let money100Light = Color(hex: 0xE2F3F4, opacity: 1.0)
    static let money100Dark = Color(hex: 0x8FD2D7, opacity: 1.0)
    
    static let money200Light = Color(hex: 0xEEF8FD, opacity: 1.0)
    static let money200Dark = Color(hex: 0xBEC0C1, opacity: 1.0)
    
    static let money500Light = Color(hex: 0xEEE2E2, opacity: 1.0)
    static let money500Dark = Color(hex: 0xE37979, opacity: 1.0)
    
    static let money1000Light = Color(hex: 0xECE2C3, opacity: 1.0)
    static let money1000Dark = Color(hex: 0xECC649, opacity: 1.0)
    
    static let money2000Light = Color(hex: 0x000000, opacity: 1.0)
    static let money2000Dark = Color(hex: 0xFAFAFA, opacity: 1.0)
    
    static let money5000Light = Color(hex: 0xFAFAFA, opacity: 1.0)
    static let money5000Dark = Color(hex: 0x000000, opacity: 1.0)
    
    static let moneyQuestionLight = Color(hex: 0xFAFAFA, opacity: 1.0)
    static let moneyQuestionDark = Color(hex: 0x000000, opacity: 1.0)
    
    static let neutralButtonLight = Color(hex: 0xFFFFFF, opacity: 1.0)
    static let neutralButtonDark = Color(hex: 0xE8E8E8, opacity: 1.0)
    static let neutralButtonText = Color(hex: 0x82A883, opacity: 1.0)
    
    static let positiveButtonLight = Color(hex: 0xE9FBEA, opacity: 1.0)
    static let positiveButtonDark = Color(hex: 0xA5D6A7, opacity: 1.0)
    static let positiveButtonText = Color(hex: 0x2A442B, opacity: 1.0)
    
    static let negativeButtonLight = Color(hex: 0xFFF5F5, opacity: 1.0)
    static let negativeButtonDark = Color(hex: 0xE5BFBF, opacity: 1.0)
    static let negativeButtonText = Color(hex: 0x752D2D, opacity: 1.0)
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

extension Font {
    static let regularSmall = Font.custom("ChauPhilomeneOne-Regular", size: 25.0)
    static let regularMedium = Font.custom("ChauPhilomeneOne-Regular", size: 30.0)
    static let regularLarge = Font.custom("ChauPhilomeneOne-Regular", size: 40.0)
    
    static let italicSmall = Font.custom("ChauPhilomeneOne-Italic", size: 25.0)
    static let italicMedium = Font.custom("ChauPhilomeneOne-Italic", size: 30.0)
    static let italicLarge = Font.custom("ChauPhilomeneOne-Italic", size: 40.0)
    
    enum ChauPhilomeneOne {
        case chauPhilomeneOneRegular, chauPhilomeneOneItalic
        
        var value: String {
            switch self {
                case .chauPhilomeneOneRegular:
                    return "ChauPhilomeneOne-Regular"
                
                case .chauPhilomeneOneItalic:
                    return "ChauPhilomeneOne-Italic"
            }
        }
    }

    
    static func custom(_ type: ChauPhilomeneOne, size: CGFloat = 12) -> Font {
        return .custom(type.value, size: size)
    }
    
    static func regular(size: CGFloat = 12) -> Font {
        return .custom("ChauPhilomeneOne-Regular", size: size)
    }
    
    static func italic(size: CGFloat = 12) -> Font {
        return .custom("ChauPhilomeneOne-Italic", size: size)
    }
}

extension String {
    var capitalizedSentence: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }
}
