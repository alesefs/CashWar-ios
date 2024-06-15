//
//  CashMoney.swift
//  Cash War
//
//  Created by Alessandro Emanuel Ferreira de Souza on 11/06/24.
//

import SwiftUI

struct CashMoneyStatsModel: Hashable {
    let index: Int
    let value: Int
    let lightColor: Color
    let darkColor: Color
    let fontSize: CGFloat
}

enum CashMoneyStats: Hashable {
    case money1, money2, money5, money10, money20, money50, money100, money200, money500, money1000, money2000, money5000, moneyQuestion
    
    var stats: CashMoneyStatsModel {
        switch self {
        case .money1:
            return CashMoneyStatsModel(
                index: 1,
                value: 1,
                lightColor: .money1Light,
                darkColor: .money1Dark,
                fontSize: 60.0
            )
        case .money2:
            return CashMoneyStatsModel(
                index: 2,
                value: 2,
                lightColor: .money2Light,
                darkColor: .money2Dark,
                fontSize: 60.0
            )
        case .money5:
            return CashMoneyStatsModel(
                index: 3,
                value: 5,
                lightColor: .money5Light,
                darkColor: .money5Dark,
                fontSize: 60.0
            )
        case .money10:
            return CashMoneyStatsModel(
                index: 4,
                value: 10,
                lightColor: .money10Light,
                darkColor: .money10Dark,
                fontSize: 60.0
            )
        case .money20:
            return CashMoneyStatsModel(
                index: 5,
                value: 20,
                lightColor: .money20Light,
                darkColor: .money20Dark,
                fontSize: 60.0
            )
        case .money50:
            return CashMoneyStatsModel(
                index: 6,
                value: 50,
                lightColor: .money50Light,
                darkColor: .money50Dark,
                fontSize: 60.0
            )
        case .money100:
            return CashMoneyStatsModel(
                index: 7,
                value: 100,
                lightColor: .money100Light,
                darkColor: .money100Dark,
                fontSize: 40.0
            )
        case .money200:
            return CashMoneyStatsModel(
                index: 8,
                value: 200,
                lightColor: .money200Light,
                darkColor: .money200Dark,
                fontSize: 40.0
            )
        case .money500:
            return CashMoneyStatsModel(
                index: 9,
                value: 500,
                lightColor: .money500Light,
                darkColor: .money500Dark,
                fontSize: 40.0
            )
        case .money1000:
            return CashMoneyStatsModel(
                index: 10,
                value: 1000,
                lightColor: .money1000Light,
                darkColor: .money1000Dark,
                fontSize: 30.0
            )
        case .money2000:
            return CashMoneyStatsModel(
                index: 11,
                value: 2000,
                lightColor: .money2000Light,
                darkColor: .money2000Dark,
                fontSize: 30.0
            )
        case .money5000:
            return CashMoneyStatsModel(
                index: 12,
                value: 5000,
                lightColor: .money5000Light,
                darkColor: .money5000Dark,
                fontSize: 30.0
            )
        case .moneyQuestion:
            return CashMoneyStatsModel(
                index: 0,
                value: 0,
                lightColor: .moneyQuestionLight,
                darkColor: .moneyQuestionDark,
                fontSize: 60.0
            )
        }
    }
}

enum CashMoneySize: Hashable {
    case normal, tiny
    
    var fontSize: CGFloat {
        switch self {
        case .normal:
            return 1.0
        case .tiny:
            return 2.0
        }
    }
}

enum CashMoneyAnimation: Hashable {
    case idle, leading, trailling
    
    var animation: Int {
        switch self {
        case .idle:
            0
        case .leading:
            1
        case .trailling:
            2
        }
    }
}

struct CashMoney: View {
    var value: CashMoneyStats
    var size: CashMoneySize
    var waitRound: Bool = false
    var animation: CashMoneyAnimation = CashMoneyAnimation.idle
    var selected: Bool = false
    
    private var offsetLeading: CGFloat = -500
    private var offsetTrailling: CGFloat = 500
    private var offsetIdle: CGFloat = 0
    private var animationAmount: CGFloat = 1.0
    
    init(
        value: CashMoneyStats,
        size: CashMoneySize,
        waitRound: Bool,
        animation: CashMoneyAnimation,
        selected: Bool
    ) {
        self.value = value
        self.size = size
        self.waitRound = waitRound
        self.animation = animation
        self.selected = selected
    }
    
    var body: some View {
        
        let offset = switch animation {
            case .idle:
                offsetIdle
            case .leading:
                offsetLeading
            case .trailling:
                offsetTrailling
        }
        
        ZStack {
            Rectangle()
                .foregroundColor(value.stats.lightColor)
                .border(value.stats.darkColor, width: 10 / size.fontSize)
            
            HStack {
                
                VStack (alignment: .leading) {
                    Circle()
                        .foregroundColor(value.stats.darkColor)
                        .frame(width: 30 / size.fontSize)
                    
                    Spacer()
                    
                    Circle()
                        .foregroundColor(value.stats.darkColor)
                        .frame(width: 30 / size.fontSize)
                }
                
                Spacer()
                
                VStack (alignment: .trailing) {
                    Circle()
                        .foregroundColor(value.stats.darkColor)
                        .frame(width: 30 / size.fontSize)
                    
                    Spacer()
                    
                    Circle()
                        .foregroundColor(value.stats.darkColor)
                        .frame(width: 30 / size.fontSize)
                }
                
            }
            
            HStack {
                Spacer()
                
                Circle()
                    .foregroundColor(value.stats.darkColor)
                    .frame(width: 30 / size.fontSize)
                
                Spacer()
                
                ZStack {
                    Circle()
                        .foregroundColor(value.stats.darkColor)
                        .frame(width: 70 / size.fontSize)
                    
                    let cashValue = (value == .moneyQuestion) ? "?" : "\(value.stats.value)"
                    let cashColor = (value == .moneyQuestion) ? Color.random : value.stats.lightColor
                    
                    Text(cashValue)
                        .foregroundColor(cashColor)
                        .font(
                            .regular(
                                size: value.stats.fontSize / size.fontSize
                            )
                        )
                        .lineLimit(1)
                }
                
                Spacer()
                
                Circle()
                    .foregroundColor(value.stats.darkColor)
                    .frame(width: 30 / size.fontSize)
                
                Spacer()
            }
            
        }
        .frame(width: 220 / size.fontSize, height: 110 / size.fontSize)
        .offset(x: waitRound ? 0 : offset)
        .animation(.easeInOut(duration: 0.8), value: waitRound)
        .border(selected ? .red : .clear, width: selected ? (5 / size.fontSize) : 0) 
        
    }
    
}

#Preview {
    CashMoney(
        value: .money1,
        size: .normal,
        waitRound: false,
        animation: .idle,
        selected: false)
    
}

struct CashMoney_Previews: PreviewProvider {
    static var previews: some View {
        var allCasesCash: [CashMoneyStats] {
            return [
                .money1, .money2, .money5,
                .money10, .money20, .money50,
                .money100, .money200, .money500,
                .money1000, .money2000, .money5000,
                .moneyQuestion
            ]
        }
        
        var allCasesSize: [CashMoneySize] {
            return [
                .normal, .tiny
            ]
        }
        
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                ForEach(allCasesCash, id: \.self) { cash in
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(allCasesSize, id: \.self) { size in
                                CashMoney(
                                    value: cash, 
                                    size: size,
                                    waitRound: false,
                                    animation: .idle,
                                    selected: false
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}
