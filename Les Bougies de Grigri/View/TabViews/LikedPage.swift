//
//  LikedPage.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 21/03/2023.
//

import SwiftUI

struct LikedPage: View {
    
    @EnvironmentObject var cartManager: CartManager
    @StateObject var sharedData: DetailDataModel = DetailDataModel()
    @State var showDeleteOption: Bool = false
    @Namespace var animation
    
    
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    if cartManager.products.isEmpty {
                        Group {
                            Image("S16")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                                .padding(.top, 35)
                            
                            Text("No favorites yet ...")
                                .font(.title).bold()
                            
                            Text("Hit the like button on each product to save your favorites here.")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                                .padding(.top, 10)
                                .multilineTextAlignment(.leading)
                        }
                    } else {
                        
                        VStack(spacing: 5) {
                            
                            ForEach(cartManager.products) {product in
                                
                                HStack(spacing: 0) {
                                    
                                    if showDeleteOption {
                                        
                                        Button {
                                            cartManager.removeToLiked(product: product)
                                        } label: {
                                            Image(systemName: "minus.circle.fill")
                                                .font(.title2)
                                                .foregroundColor(.red)
                                        }
                                        .padding(.trailing)
                                    }
                                    
                                    CardViewFav(item: product, animation: animation)
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
            .navigationTitle(Text("Liked products"))
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            showDeleteOption.toggle()
                        }
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    
                }
            }
            .padding(.top)
        }
    }
}

struct LikedPage_Previews: PreviewProvider {
    static var previews: some View {
        LikedPage()
            .environmentObject(DetailDataModel())
            .environmentObject(CartManager())
    }
}


