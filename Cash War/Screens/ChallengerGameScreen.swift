//
//  ChallengerGameScreen.swift
//  Cash War
//
//  Created by Alessandro Emanuel Ferreira de Souza on 12/06/24.
//

import SwiftUI

struct ChallengerGameScreen: View {
    @EnvironmentObject var navigation: Navigation
    
    @State private var playerCash = 0
    @State private var playerCashChooser = 0
    @State private var playerBank = 100
    @State private var diffTextPlayer = ""
    
    @State private var playerCashLeft = (cashValues.randomElement())!
    @State private var playerCashLeftSelected = false
    
    @State private var playerCashCenter = (cashValues.randomElement())!
    @State private var playerCashCenterSelected = false
    
    @State private var playerCashRight = (cashValues.randomElement())!
    @State private var playerCashRightSelected = false
    
    @State private var cpuCashValue = (cashValues.randomElement())!
    @State private var cpuBank = 100
    @State private var diffTextCPU = ""
    
    @State private var inGame = true
    @State private var playerWin: Bool = true
    @State private var canPlay: Bool = true
    @State private var waitRound: Bool = false
    @State private var playerWasChosen: Bool = false
    
    var questionsMap = [
        "Player > CPU",
        "Player < CPU"
    ]
    
    @State private var question = Int.random(in: 0...1)
    
    
    var body: some View {
        ZStack(alignment: .top) {
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
                
                HStack {
                    CashMoney(
                        value: playerCashLeft,
                        size: .tiny,
                        waitRound: waitRound,
                        animation: .idle,
                        selected: playerCashLeftSelected
                    ).onTapGesture {
                        playerCashChooser = playerCashLeft.stats.value
                        
                        playerCashLeftSelected = true
                        playerCashCenterSelected = false
                        playerCashRightSelected = false
                        
                        playerWasChosen = true
                    }
                    
                    CashMoney(
                        value: playerCashCenter,
                        size: .tiny,
                        waitRound: waitRound,
                        animation: .idle,
                        selected: playerCashCenterSelected
                    ).onTapGesture {
                        playerCashChooser = playerCashCenter.stats.value
                        
                        playerCashLeftSelected = false
                        playerCashCenterSelected = true
                        playerCashRightSelected = false
                        
                        playerWasChosen = true
                    }
                    
                    CashMoney(
                        value: playerCashRight,
                        size: .tiny,
                        waitRound: waitRound,
                        animation: .idle,
                        selected: playerCashRightSelected
                    ).onTapGesture {
                        playerCashChooser = playerCashRight.stats.value
                        
                        playerCashLeftSelected = false
                        playerCashCenterSelected = false
                        playerCashRightSelected = true
                        
                        playerWasChosen = true
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 32.0)
                
                Text(questionsMap[question])
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.regularMedium)
                    .opacity(0.9)
                    .lineLimit(1)
                    .padding(.horizontal, 32.0)
                
                CashMoney(
                    value: canPlay ? .moneyQuestion : cpuCashValue,
                    size: .normal,
                    waitRound: waitRound,
                    animation: .idle,
                    selected: false
                )
                
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
                
                CashButton(
                    buttonStats: .negative(title: "Challenger"),
                    enable: canPlay && playerWasChosen
                ) {
                    showStats()
                    
                    inGame = playerBank > 0 && cpuBank > 0
                                    
                    canPlay = false
                    waitRound = true
                    
                    if !inGame {
                        playerWin = playerBank > 0
                        NavigateToEndGame(playerWin: playerWin)
                    } else {
                        nextChallenger()
                    }
                }
                .frame(width: 250, height: 55)
            }
            .padding(.horizontal, 32.0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            playerCashLeft = (cashValues.randomElement())!
            
            let valueCenter = cashValues.filter { cash in
                cash.stats.index != playerCashLeft.stats.index
            }
            playerCashCenter = (valueCenter.randomElement())!
            
            let valueRight = cashValues.filter { cash in
                cash.stats.index != playerCashLeft.stats.index && cash.stats.index != playerCashCenter.stats.index
            }
            playerCashRight = (valueRight.randomElement())!
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
    
    private func showStats() {
        switch question {
            case 0:
                if playerCashChooser > cpuCashValue.stats.value {
                    playerBank += 10
                    cpuBank -= 10
                } else {
                    playerBank -= 10
                    cpuBank += 10
                }
            case 1:
                if playerCashChooser < cpuCashValue.stats.value {
                    playerBank += 10
                    cpuBank -= 10
                } else {
                    playerBank -= 10
                    cpuBank += 10
                }
                
            default:
                playerBank -= 5
                diffTextPlayer = "-5"
                cpuBank += 0
                diffTextCPU = "0"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            switch question {
                case 0:
                    if playerCashChooser > cpuCashValue.stats.value {
                        diffTextPlayer = "+10"
                        diffTextCPU = "-10"
                    } else {
                        diffTextPlayer = "-10"
                        diffTextCPU = "+10"
                    }
                case 1:
                    if playerCashChooser < cpuCashValue.stats.value {
                        diffTextPlayer = "+10"
                        diffTextCPU = "-10"
                    } else {
                        diffTextPlayer = "-10"
                        diffTextCPU = "+10"
                    }
                    
                default:
                    diffTextPlayer = "-5"
                    diffTextCPU = "0"
            }
        }
    }
    
    private func nextChallenger() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            diffTextPlayer = ""
            diffTextCPU = ""
            waitRound = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            canPlay = true
            playerWasChosen = false
            playerCashLeftSelected = false
            playerCashCenterSelected = false
            playerCashRightSelected = false
            question = Int.random(in: 0...1)
            
            playerCashLeft = (cashValues.randomElement())!
            
            let valueCenter = cashValues.filter { cash in
                cash.stats.index != playerCashLeft.stats.index
            }
            playerCashCenter = (valueCenter.randomElement())!
            
            let valueRight = cashValues.filter { cash in
                cash.stats.index != playerCashLeft.stats.index && cash.stats.index != playerCashCenter.stats.index
            }
            playerCashRight = (valueRight.randomElement())!
            
            cpuCashValue = (cashValues.randomElement())!
        }
    }
}

#Preview {
    ChallengerGameScreen()
        .environmentObject(Navigation())
}
