//
//  SplashView.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 24/03/2023.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            Main_Page()
                .environmentObject(CartManager())
                .environmentObject(DetailDataModel())
                .environmentObject(BougiesModelView())
        } else {
            VStack {
                VStack(alignment: .center) {
                    Image(systemName: "flame")
                        .font(.system(size: 80))
    
                }
                .shadow(radius: 150)
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 3)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
