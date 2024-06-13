//
//  SplashScreen.swift
//  Cash War
//
//  Created by Alessandro Emanuel Ferreira de Souza on 12/06/24.
//

import SwiftUI

struct SplashScreen: View {
    @State var showMenu: Bool = false
        
        var body: some View {
            ZStack {
                if self.showMenu {
                    MainMenuScreen()
                } else {
                    SplashScreenView()
                        
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.showMenu = true
                    }
                }
            }
        }
}

struct SplashScreenView: View {
    
    @State private var scale: CGFloat = 0.25
    
    var body: some View {
        ZStack(alignment: .center) {
            Image("table_green")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            Rectangle()
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Image("ae_brand")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                Text("Alessandro Emanuel")
                    .foregroundColor(.money1Light)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.regularMedium)
                    .lineLimit(1)
            }
            .scaleEffect(scale)
            .onAppear{
                withAnimation(.easeIn(duration: 0.8)) {
                    self.scale = 1
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
