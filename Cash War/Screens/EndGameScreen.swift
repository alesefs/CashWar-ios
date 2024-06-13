//
//  EndGameScreen.swift
//  Cash War
//
//  Created by Alessandro Emanuel Ferreira de Souza on 12/06/24.
//

import SwiftUI

struct EndGameScreen: View {
    
    @State var isWin: Bool
    
    init(isWin: Bool) {
        self.isWin = isWin
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            Image("table_green")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            Rectangle()
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                Image("cash_war_logo")
                    .resizable()
                    .frame(width: 170, height: 100)
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                if self.isWin {
                    WinGame()
                } else {
                    LoseGame()
                }
                
                Spacer()
                
                CashButton(buttonStats: .positive(title: "Menu"), enable: true) {
                    print("menu click")
                }
                .frame(maxWidth: 300)
            }
            .padding(.vertical, 64.0)
            .padding(.horizontal, 32.0)
        }
    }
}

struct WinGame: View {
    var body: some View {
        Image("you_win")
            .resizable()
            .frame(width: 300, height: 162)
            .aspectRatio(contentMode: .fit)
    }
}

struct LoseGame: View {
    var body: some View {
        Image("you_lose")
            .resizable()
            .frame(width: 260, height: 218)
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    EndGameScreen(isWin: true)
}

#Preview {
    EndGameScreen(isWin: false)
}
