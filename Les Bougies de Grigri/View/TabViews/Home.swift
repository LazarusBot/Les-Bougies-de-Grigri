//
//  Home.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 08/03/2023.
//

import SwiftUI

struct Home: View {
    
    @StateObject var cartManager = CartManager()
    @StateObject var sharedData: DetailDataModel = DetailDataModel()
    @StateObject var homeData: BougiesModelView = BougiesModelView()
    @Namespace var animation
    @State var show = false
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                HStack {
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "flame")
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.black)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "person.crop.square")
                            .font(.system(size: 25, weight: .heavy))
                            .tint(.black)
                    }
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                
                VStack {
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("Let's")
                                .font(.title)
                                .foregroundColor(.black)
                            
                            Text("Light Your Home")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundStyle(
                                    
                                    LinearGradient(
                                        colors: [.red, .yellow],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                        }
                        .padding(.horizontal)
                        
                        Spacer(minLength: 0)
                        
                    }
                    
                    
                    
                    HStack(spacing: 25) {
                        
                        ForEach(ProductType.allCases, id: \.self) {type in
                            
                            ProductTypeView(type: type)
                            
                        }
                    }
                    .padding(.vertical, -2)
                    .padding(.top, 0)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 20) {
                            ForEach(homeData.filteredBougies) {product in
                                
                                CardView(item: product, animation: animation)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            sharedData.detailProduct = product
                                            sharedData.showDetailProduct.toggle()
                                            show.toggle()
                                        }
                                    }
                            }
                        }
                        .padding()
                    }
                }
                
                Spacer(minLength: 0)
                
            }
            .overlay (
                ZStack {
                    if let product = sharedData.detailProduct, sharedData.showDetailProduct {
                        ProductDetail(selectItem: product, animation: animation)
                            .environmentObject(sharedData)
                        
                    }
                }
            )
            
        }
        .onChange(of: homeData.productType) {newValue in
            homeData.filterBougieByType()
        }
        
    }
    
    @ViewBuilder
    func ProductTypeView(type: ProductType)-> some View {
        Button {
            withAnimation(.spring()){homeData.productType = type}
        } label: {
            Text(type.rawValue)
                .font(.system(size: (homeData.productType == type ? 16 : 12)))
                .foregroundColor(homeData.productType == type ? .white : .black)
                .padding(.vertical, 10)
                .padding(.horizontal, homeData.productType == type ? 15 : 0)
                .background(
                    
                    ZStack {
                        if homeData.productType == type {
                            Color.black
                                .clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                    
                )
        }
    }
    
}



