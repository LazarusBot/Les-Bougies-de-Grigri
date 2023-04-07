//
//  SearchView.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 13/03/2023.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var sharedData: DetailDataModel = DetailDataModel()
    @StateObject var homeData: BougiesModelView = BougiesModelView()
    @Namespace var animation
    
    var body: some View {
        
        VStack {
            
            HStack(spacing: 15) {
                
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 18, weight: .heavy))
                
                TextField("Search...", text: $homeData.searchText)
                    .font(.system(size: 18, weight: .heavy))
                    .disableAutocorrection(true)
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(
                Capsule()
                    .strokeBorder(Color.gray, lineWidth: 2)
            )
            .frame(width: UIScreen.main.bounds.width / 1.2)
            
            if let products = homeData.searchedProducts {
                
                if products.isEmpty {
                    
                    VStack(spacing: 10) {
                        
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.red)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .padding(.top, 60)
                        
                        Text("Item not found !")
                            .font(.system(size: 22))
                        
                        Text("Essaye une recherche plus globale ou cherche un autre produit")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                    }
                    .padding()
                    
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(spacing: 0) {
                            
                            Text("Found \(products.count) results")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .padding(.vertical)
                            
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 29), count: 2), spacing: 10) {
                                ForEach(products) {product in
                                    
                                    CardView(item: product, animation: animation)
                                        .onTapGesture {
                                        withAnimation(.spring()) {
                                            sharedData.fromSearchPage = true
                                            sharedData.detailProduct = product
                                            sharedData.showDetailProduct.toggle()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
            } else {
                
                ProgressView()
                    .padding(.top, 30)
                    .opacity(homeData.searchText == "" ? 0 : 1)
            }
            
            Spacer()
        }
        .padding()
        .overlay (
            ZStack {
                
                if let product = sharedData.detailProduct, sharedData.fromSearchPage {
                    ProductDetail(selectItem: product, animation: animation)
                        .environmentObject(sharedData)
                    
                }
            }
        )
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
