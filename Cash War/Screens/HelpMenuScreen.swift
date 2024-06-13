//
//  HelpMenuScreen.swift
//  Cash War
//
//  Created by Alessandro Emanuel Ferreira de Souza on 12/06/24.
//

import SwiftUI

struct HelpMenuScreen: View {
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
            
            VStack(spacing: 40) {
                Image("cash_war_logo")
                    .resizable()
                    .frame(width: 170, height: 100)
                    .aspectRatio(contentMode: .fit)
                
                Text("DEAL: Play until someone goes bankrupt")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.regularMedium)
                    .lineLimit(5)
                    .padding(.horizontal, 32.0)
                
                Text("BET 10: Play 10 rounds to see who earns more")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.regularMedium)
                    .lineLimit(5)
                    .padding(.horizontal, 32.0)
                
                Text("CHALLENGER: Bet every turn if you beat the bank by getting the challenges right")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.regularMedium)
                    .lineLimit(5)
                    .padding(.horizontal, 32.0)
                
                CashButton(buttonStats: .positive(title: "Menu"), enable: true) {
                    print("menu click")
                }
                .frame(maxWidth: 300)
            }
            .padding(.horizontal, 32.0)
            .padding(.vertical, 64.0)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    HelpMenuScreen()
}
