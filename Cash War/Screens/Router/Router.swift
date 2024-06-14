//
//  Router.swift
//  Cash War
//
//  Created by Alessandro Emanuel Ferreira de Souza on 14/06/24.
//

import SwiftUI

enum Screens: Hashable {
    case MainMenuScreen, HelpMenuScreen, GameDealScreen, GameBet10Screen, GameChallengerScreen
    case EndGameScreen(isWin: Bool)
}

class Navigation: ObservableObject {
    @Published var path = [Screens]()
}

class NavigationController {
    @ViewBuilder
    static func navigate(to screen: Screens) -> some View {
        var isWin : Bool {
            switch screen {
                case .EndGameScreen(let isWin):
                    isWin
                default:
                    true
            }
        }
        
        switch screen {
        case .MainMenuScreen:
            MainMenuScreen()
        case .HelpMenuScreen:
            HelpMenuScreen()
        case .GameDealScreen:
            DealGameScreen()
        case .GameBet10Screen:
            Bet10GameScreen()
        case .GameChallengerScreen:
            ChallengerGameScreen()
        case .EndGameScreen:
            EndGameScreen(isWin: isWin)
        }
    }
}
