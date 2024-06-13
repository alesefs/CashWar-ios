//
//  MainMenuScreen.swift
//  Cash War
//
//  Created by Alessandro Emanuel Ferreira de Souza on 12/06/24.
//

import SwiftUI

struct Screens: Identifiable, Hashable {
    let name: String
    let id = NSUUID().uuidString
}

struct MainMenuScreen: View {
    let screens: [Screens] = [
        .init(name: "Deal"),
        .init(name: "Bet10"),
        .init(name: "Challenger"),
        .init(name: "Help"),
    ]
    
//    @State private var navigationPath = [Screens]()
    @State private var path = NavigationPath()
    
    var body: some View {
        
        /*NavigationStack(path: $navigationPath) {*/
        NavigationStack(path: $path) {
            
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
                    /*
//                    List {
                        ForEach(screens) { screen in
//                            NavigationLink(value: screen) {
//                                Text(screen.name)
                                CashButton(buttonStats: .neutral(title: screen.name), enable: true) {
                                    print("\(screen.name) click")
                                    navigationPath.append(screen)
                                }
//                            }
                        }
//                    }
//                    .navigationDestination(for: Screens.self) { brand in
//                        VStack {
//                            viewForBrand(brand).navigationBarBackButtonHidden(true)
//                        }
//                    }
                    */
                    CashButton(buttonStats: .neutral(title: "Deal"), enable: true) {
                        print("deal click")
                        path.append("Deal")
                    }
                    
                    CashButton(buttonStats: .neutral(title: "Bet 10"), enable: true) {
                        print("bet 10 click")
                        path.append("Bet")
                    }
                    
                    CashButton(buttonStats: .negative(title: "Challenger"), enable: true) {
                        print("challenger click")
                        path.append("Challenger")
                    }
                    
                    CashButton(buttonStats: .positive(title: "Help"), enable: true) {
                        print("Help click")
                        path.append("Help")
                    }
                    
                    CashButton(buttonStats: .negative(title: "End"), enable: true) {
                        print("End click")
                        path.append("End")
                    }
                }
                .frame(width: 300, alignment: .center)
//                .navigationDestination(for: Screens.self) { brand in
//                    VStack {
//                        viewForBrand(brand)//.navigationBarBackButtonHidden(true)
//                    }
//                }
                .navigationDestination(for: String.self) { view in
                    if view == "Deal" {
                        DealGameScreen()
                    }
                    else if view == "Bet" {
                        Bet10GameScreen()
                    }
                    else if view == "Challenger" {
                        ChallengerGameScreen()
                    }
                    else if view == "Help" {
                        HelpMenuScreen()
                    }
                    else if view == "End" {
                        EndGameScreen(isWin: true)
                    }
                    else {
                        ContentView()
                    }
                }
            }
        }
    }
    
    /*
    func viewForBrand(_ brand: Screens) -> AnyView {
        switch brand.name {
        case "Deal":
            return AnyView(DealGameScreen())
        case "Bet10":
            return AnyView(Bet10GameScreen())
        case "Challenger":
            return AnyView(ChallengerGameScreen())
        case "Help":
            return AnyView(HelpMenuScreen())
        default:
            return AnyView(ContentView())
        }
    }
     */
}

#Preview {
    MainMenuScreen()
}
