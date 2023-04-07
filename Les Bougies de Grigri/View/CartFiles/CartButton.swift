//
//  CartButton.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 19/03/2023.
//

import SwiftUI

struct CartButton: View {
    
    var numberOfProducts: Int
    var tab: String
    var currentTab: String
    var count: Int
    
    var body: some View {
        ZStack {
            
            Image(tab)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .background(
                    Color.orange
                        .opacity(0.2)
                        .cornerRadius(100)
                        .blur(radius: 10)
                        .padding(-10)
                        .opacity(currentTab == tab ? 1 : 0)
                )
                .frame(width: 22, height: 22)
                .frame(maxWidth: .infinity)
                .foregroundColor(currentTab == tab ?  Color.orange : Color.black.opacity(0.3)
                )
            
            if numberOfProducts > 0 {
                Text("\(count)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 17, height: 17)
                    .background(
                        Color(hue: 1.0, saturation: 0.89, brightness: 0.835)
                    )
                    .cornerRadius(50)
                    .padding(.top, -17)
                    .padding(.trailing, -18)
            }
        }
    }
}
