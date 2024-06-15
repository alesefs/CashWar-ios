//
//  DealGameScreen.swift
//  Cash War
//
//  Created by Alessandro Emanuel Ferreira de Souza on 12/06/24.
//

import SwiftUI

struct DealGameScreen: View {
    @EnvironmentObject var navigation: Navigation
    
    @State private var playerCashValue = 0
    @State private var playerCash = 0
    @State private var playerBank = 2000
    @State private var diffTextPlayer = ""
    
    @State private var cpuCashValue = 0
    @State private var cpuCash = 0
    @State private var cpuBank = 2000
    @State private var diffTextCPU = ""
    
    @State private var inGame = true
    @State private var playerWin: Bool = true
    @State private var canPlay: Bool = true
    @State private var waitRound: Bool = false
    
    @State private var isFirstRound: Bool = true
    
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
            
            VStack(spacing: 32.0) {
                                
                Image("cash_war_logo")
                    .resizable()
                    .frame(width: 170, height: 100)
                    .aspectRatio(contentMode: .fit)
                
                HStack(spacing: 16.0) {
                    Text("Player's Bank: $\(playerBank)")
                        .foregroundColor(.white)
                        .font(.regularSmall)
                        .opacity(0.9)
                        .lineLimit(1)
                    
                    Text(diffTextPlayer)
                        .foregroundColor(diffTextColor(signal: diffTextPlayer))
                        .font(.regularLarge)
                        .opacity(0.9)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 32.0)
                
                CashMoney(
                    value: chooseCash(intValue: playerCashValue),
                    size: .normal,
                    waitRound: waitRound,
                    animation: isFirstRound ? .idle : .leading,
                    selected: false)
                
                Text("Vs.")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.regularMedium)
                    .opacity(0.9)
                    .lineLimit(1)
                    .padding(.horizontal, 32.0)
                
                
                CashMoney(
                    value: chooseCash(intValue: cpuCashValue),
                    size: .normal,
                    waitRound: waitRound,
                    animation:  isFirstRound ? .idle : .trailling,
                    selected: false)
                
                HStack(spacing: 16.0) {
                    Text("CPU's Bank: $\(cpuBank)")
                        .foregroundColor(.white)
                        .font(.regularSmall)
                        .opacity(0.9)
                        .lineLimit(1)
                    
                    Text(diffTextCPU)
                        .foregroundColor(diffTextColor(signal: diffTextCPU))
                        .font(.regularLarge)
                        .opacity(0.9)
                        .lineLimit(1)
                        
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 32.0)
                
                CashButton(buttonStats: .positive(title: "Deal"), enable: canPlay) {
                    isFirstRound = false
                    
                    playerCashValue = Int.random(in: 1 ... 91)
                    playerCash = chooseCash(intValue: playerCashValue).stats.value
                    
                    cpuCashValue = Int.random(in: 1 ... 91)
                    cpuCash = chooseCash(intValue: cpuCashValue).stats.value
                    
                    let diff = abs(playerCash - cpuCash)
                    
                    showStats(diff: diff)
                    
                    inGame = playerBank > 0 && cpuBank > 0
                    
                    canPlay = false
                    waitRound = true
                    
                    if !inGame {
                        playerWin = playerBank > 0
                        NavigateToEndGame(playerWin: playerWin)
                    } else {
                        nextDeal()
                    }
                    
                }
                .frame(width: 250, height: 55)
            }
            .padding(.horizontal, 32.0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationDestination(for: Screens.self) { screen in
            NavigationController.navigate(to: screen)
        }
    }
    
    private func NavigateToEndGame(playerWin: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            navigation.path.append(Screens.EndGameScreen(isWin: playerWin))
        }
    }
    
    private func nextDeal() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            diffTextPlayer = ""
            diffTextCPU = ""
            waitRound = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            canPlay = true
        }
    }
    
    private func showStats(diff: Int) {
        if playerCash > cpuCash {
            playerBank += diff
            cpuBank -= diff
            
        } else if playerCash < cpuCash {
            playerBank -= diff
            cpuBank += diff
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            if playerCash > cpuCash {
                diffTextPlayer = "+\(diff)"
                diffTextCPU = "-\(diff)"
                
            } else if playerCash < cpuCash {
                diffTextPlayer = "-\(diff)"
                diffTextCPU = "+\(diff)"
                
            } else {
                diffTextPlayer = "0"
                diffTextCPU = "0"
            }
        }
    }
}

#Preview {
    DealGameScreen()
        .environmentObject(Navigation())
}
