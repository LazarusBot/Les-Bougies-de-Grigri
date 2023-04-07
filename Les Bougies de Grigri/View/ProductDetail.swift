//
//  ProductDetail.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 10/03/2023.
//

import SwiftUI

struct ProductDetail: View {
    
    @EnvironmentObject var sharedData: DetailDataModel
    @EnvironmentObject var cartManager: CartManager
    var selectItem: Bougies
    var show: Bool = false
    var animation: Namespace.ID
    
    var body: some View {
        
        VStack {
            
            HStack(spacing: 25) {
                
                Button {
                    withAnimation(.spring()){
                        sharedData.showDetailProduct.toggle()
                        sharedData.fromSearchPage = false
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                        .foregroundColor(.black)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "bag")
                        .font(.title)
                        .foregroundColor(.black)
                }



            }
            .padding()
            
            VStack(spacing: 10) {
                
                Image(selectItem.image)
                    .resizable()
                    .frame(width: 320, height: 320)
                    .matchedGeometryEffect(id: "\(sharedData.fromSearchPage ? "search" : "image")\(selectItem.id)", in: animation)
                    .padding()
                    .padding(.top, -20)
                
                Text(selectItem.title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.top, -60)
                
                Text(selectItem.subtitle)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)
                    .padding(.top, -30)
                
                HStack {
                    
                    Text(selectItem.rating)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .matchedGeometryEffect(id: "rating\(selectItem.id)", in: animation)
                    
                    Spacer(minLength: 0)
                    
                    Button {
                        if isLiked() {
                            cartManager.removeToLiked(product: selectItem)
                        } else {
                            cartManager.addToLiked(product: selectItem)
                        }
                    } label: {
                        Image(systemName: "suit.heart.fill")
                            .font(.title2)
                            .foregroundColor(isLiked() ? .red : .black.opacity(0.78))
                    }
                    .matchedGeometryEffect(id: "heart\(selectItem.id)", in: animation)
 
                }
                .padding()
                
            }
            .padding(.top, -30)
            .background(
                RadialGradient(gradient: Gradient(colors: [Color(selectItem.image).opacity(0.4), .white]), center: .center, startRadius: 2, endRadius: 400)
                    .blur(radius: 5)
                    .clipShape(CustomShape())
                    .matchedGeometryEffect(id: "color\(selectItem.id)", in: animation)
            )
            .cornerRadius(15)
            
            HStack {
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Text("Frais de port offert dès 80€ d'achat pour la France.Tous les envois se font par Mondial Relay, un mail vous sera envoyé dans les 24h/48h après votre commande pour sélectionner votre point de retrait. Pensez à regarder dans vos spams.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .font(.caption)
                }
                
            }
            .padding()
            
            Spacer(minLength: 0)
            
            HStack {
                Text("Total : ")
                    .font(.title3)
                
                Spacer(minLength: 0)
                
                Text("$\(selectItem.price)")
                    .fontWeight(.heavy)
                    .foregroundColor(Color(selectItem.image))

            }
            .padding()
            
            Button {
                cartManager.addToCart(product: selectItem)
            } label: {
                Text("Add to cart")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(
                        Color(selectItem.image).opacity(0.7)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.06),radius: 5)
                    )
            }

        }
        .opacity(show ? 0 : 1)
        .padding()
        .background(Color.white)
    }
    
    func isLiked()-> Bool {
        return cartManager.products.contains {product in
            return self.selectItem.id == product.id
        }
    }
}

