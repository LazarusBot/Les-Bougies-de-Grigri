//
//  CardViewFav.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 21/03/2023.
//

import SwiftUI

struct CardViewFav: View {
    
    @EnvironmentObject var sharedData: DetailDataModel
    @EnvironmentObject var cartManager: CartManager
    
    @State private var animationAmount = 15.0
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    let colors = [Color("c5"), Color("c4"),Color("c3"),Color("c2"),Color("c1")]
    
    var item: Bougies
    var animation: Namespace.ID
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            HStack {
                
                Spacer(minLength: 0)
                
                Text("\(item.price) $")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(radius: 12)
                
            }
            .padding(.vertical, 0)
            .padding(.horizontal, -14)
            
            HStack(spacing: 20) {
                
                Image(item.image)
                    .resizable()
                    .frame(width: 130, height: 130)
                    .matchedGeometryEffect(id: "image\(item.id)", in: animation)
                    .padding(.top, -40)
                    .padding(.horizontal, -31)
                    .shadow(radius: 10)
                
                VStack(spacing: 10) {
                    Text(item.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Text(item.subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding([.leading, .trailing])
                    
                }
                .padding(.top, -20)
                .padding(.horizontal, -12)
            }
            .padding(.horizontal, -15)
        }
        .padding(.horizontal, 10)
        .padding()
        .background(
            
            LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
                .animation(Animation.easeInOut(duration: 6)
                    .repeatForever()
                ).onReceive(timer, perform: { _ in
                    self.start = UnitPoint(x: 4, y: 0)
                    self.end = UnitPoint(x: 0, y: 2)
                    self.start = UnitPoint(x: -4, y: 20)
                    self.start = UnitPoint(x: 4, y: 0)
                })
            
        )
        .cornerRadius(25)
    }
}

