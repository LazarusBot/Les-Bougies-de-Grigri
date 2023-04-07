//
//  CardView.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 10/03/2023.
//

import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var sharedData: DetailDataModel
    @EnvironmentObject var cartManager: CartManager
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
            
            ZStack {
                
                if sharedData.showDetailProduct {
                    Image(item.image)
                        .resizable()
                        .frame(width: 130, height: 130)
                        .matchedGeometryEffect(id: "search\(item.id)", in: animation)
                        .padding(.top, -15)
                        .shadow(radius: 10)
                } else {
                    Image(item.image)
                        .resizable()
                        .frame(width: 130, height: 130)
                        .matchedGeometryEffect(id: "image\(item.id)", in: animation)
                        .padding(.top, -15)
                        .shadow(radius: 10)
                }
            }
            
            Text(item.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(item.subtitle)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
            
            
            HStack {
                Button {
                    if isLiked() {
                        cartManager.removeToLiked(product: item)
                    } else {
                        cartManager.addToLiked(product: item)
                    }
                    
                } label: {
                    Image(systemName: "suit.heart.fill")
                        .font(.title3)
                        .foregroundColor(isLiked() ? .red : .black.opacity(0.78))
                }
                .matchedGeometryEffect(id: "heart\(item.id)", in: animation)
                
                Spacer(minLength: 0)
                
                Text(item.rating)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "rating\(item.id)", in: animation)

            }
            .padding(.horizontal, 1)
            .padding(.vertical, 0)
            
        }
        .animation(.easeInOut, value: sharedData.likedProducts)
        .padding(.horizontal, 10)
        .padding()
        .background(
            RadialGradient(gradient: Gradient(colors: [Color(item.image).opacity(0.25), .white]), center: .center, startRadius: 2, endRadius: 400)
                .blur(radius: 5)
                .matchedGeometryEffect(id: "color\(item.id)", in: animation)
        )
        .cornerRadius(15)
    }
    
    func isLiked()-> Bool {
        return cartManager.products.contains {product in
            return self.item.id == product.id
        }
    }
    
}

