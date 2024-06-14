//
//  MainMenuScreen.swift
//  Cash War
//
//  Created by Alessandro Emanuel Ferreira de Souza on 12/06/24.
//

import SwiftUI

struct MainMenuScreen: View {
    
    @StateObject var navigation = Navigation()
    @State private var isWin = true
    
    var body: some View {
        
        NavigationStack(path: $navigation.path) {

            ZStack(alignment: .center) {
                
                Image("table_green")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
                Rectangle()
                    .opacity(0.5)
                    .ignoresSafeArea()
                            
                VStack(alignment: .center, spacing: 40) {
                    Image("cash_war_logo")
                        .resizable()
                        .frame(width: 170, height: 100)
                        .aspectRatio(contentMode: .fit)
                    
                    CashButton(buttonStats: .neutral(title: "Deal"), enable: true) {
                        print("deal click")
                        navigation.path.append(Screens.GameDealScreen)
                    }
                    
                    CashButton(buttonStats: .neutral(title: "Bet 10"), enable: true) {
                        print("bet 10 click")
                        navigation.path.append(Screens.GameBet10Screen)
                    }
                    
                    CashButton(buttonStats: .negative(title: "Challenger"), enable: true) {
                        print("challenger click")
                        navigation.path.append(Screens.GameChallengerScreen)
                    }
                    
                    CashButton(buttonStats: .positive(title: "Help"), enable: true) {
                        print("Help click")
                        navigation.path.append(Screens.HelpMenuScreen)
                    }
                    
                    CashButton(buttonStats: .negative(title: "End"), enable: true) {
                        isWin.toggle()
                        print("End click \(self.isWin)")
                        navigation.path.append(Screens.EndGameScreen(isWin: self.isWin))
                    }
                }
                .frame(width: 300, alignment: .center)
                .navigationDestination(for: Screens.self) { screen in
                    NavigationController.navigate(to: screen).navigationBarBackButtonHidden()
                }
            }
        }
        .environmentObject(navigation)
    }
}

#Preview {
    MainMenuScreen()
        .environmentObject(Navigation())
}
