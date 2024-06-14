//
//  Bet10GameScreen.swift
//  Cash War
//
//  Created by Alessandro Emanuel Ferreira de Souza on 12/06/24.
//

import SwiftUI

struct Bet10GameScreen: View {
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
        }
        
    }
}

#Preview {
    Bet10GameScreen()
}
