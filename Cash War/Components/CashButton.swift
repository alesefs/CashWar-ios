//
//  CashButton.swift
//  Cash War
//
//  Created by Alessandro Emanuel Ferreira de Souza on 11/06/24.
//

import SwiftUI

struct CashButtonStatsModel: Hashable {
    let text: String
    let textColor: Color
    let lightColor: Color
    let darkColor: Color
    let fontSize: CGFloat
}

enum CashButtonStats: Hashable {
    case neutral(title: String, titleSize: CGFloat = 40.0), positive(title: String, titleSize: CGFloat = 40.0), negative(title: String, titleSize: CGFloat = 40.0)
    
    var stats: CashButtonStatsModel {
        switch self {
        case .neutral(let title, let titleSize):
            return CashButtonStatsModel(text: title, textColor: .neutralButtonText, lightColor: .neutralButtonLight, darkColor: .neutralButtonDark, fontSize: titleSize)
        case .positive(let title, let titleSize):
            return CashButtonStatsModel(text: title, textColor: .positiveButtonText, lightColor: .positiveButtonLight, darkColor: .positiveButtonDark, fontSize: titleSize)
        case .negative(let title, let titleSize):
            return CashButtonStatsModel(text: title, textColor: .negativeButtonText, lightColor: .negativeButtonLight, darkColor: .negativeButtonDark, fontSize: titleSize)
        }
    }
}

struct CashButton: View {
    @State var buttonStats: CashButtonStats
    @State var enable: Bool = true
    var onClick: () -> Void
    
    init(buttonStats: CashButtonStats, enable: Bool, onClick: @escaping () -> Void) {
        self.buttonStats = buttonStats
        self.enable = enable
        self.onClick = onClick
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(buttonStats.stats.lightColor)
                .border(buttonStats.stats.darkColor, width: 5)
            
            HStack {
                
                VStack (alignment: .leading) {
                    Circle()
                        .foregroundColor(buttonStats.stats.darkColor)
                        .frame(width: 15)
                    
                    Spacer()
                    
                    Circle()
                        .foregroundColor(buttonStats.stats.darkColor)
                        .frame(width: 15)
                }
                
                Spacer()
                
                VStack (alignment: .trailing) {
                    Circle()
                        .foregroundColor(buttonStats.stats.darkColor)
                        .frame(width: 15)
                    
                    Spacer()
                    
                    Circle()
                        .foregroundColor(buttonStats.stats.darkColor)
                        .frame(width: 15)
                }
                
            }
            
            HStack {
                Spacer()
                
                Circle()
                    .foregroundColor(buttonStats.stats.darkColor)
                    .frame(width: 15)
                
                Spacer()
                
                ZStack {
                    Circle()
                        .foregroundColor(buttonStats.stats.darkColor)
                        .frame(width: 35)
                                        
                    Text("\(buttonStats.stats.text.capitalizedSentence)")
                        .foregroundColor(buttonStats.stats.textColor)
                        .font(
                            .regular(size: 30)
                        )
                        .lineLimit(1)
                }
                
                Spacer()
                
                Circle()
                    .foregroundColor(buttonStats.stats.darkColor)
                    .frame(width: 15)
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 55)
        .onTapGesture {
            if (enable) {onClick() }
        }
    }
}

#Preview {
    CashButton(
        buttonStats: .neutral(title: "texto", titleSize: 30.0), enable: true, onClick: { print("click!") }
    )
}

struct CashButton_Previews: PreviewProvider {
    static var previews: some View {
        var allCasesButtons: [CashButtonStats] {
            return [
                .neutral(title: "neutral"),
                .positive(title: "positive"),
                .negative(title: "negative")
            ]
        }
        
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                ForEach(allCasesButtons, id: \.self) { button in
                    CashButton(buttonStats: button, enable: true, onClick: { print("click no \(button.stats.text)") })
                }
            }
        }
    }
}
