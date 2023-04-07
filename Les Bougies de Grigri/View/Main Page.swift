//
//  Main Page.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 11/03/2023.
//

import SwiftUI

struct Main_Page: View {
    @EnvironmentObject var cartManager: CartManager
    @StateObject var sharedData: DetailDataModel = DetailDataModel()
    @StateObject var homeData: BougiesModelView = BougiesModelView()
    @State var currentTab: Tab = .Home
    @Namespace var animation
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            TabView(selection: $currentTab) {
                
                Home(sharedData: sharedData)
                    .environmentObject(sharedData)
                    .tag(Tab.Home)
                
                LikedPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Liked)
                
                SearchView()
                    .tag(Tab.Search)
                
                CartView()
                    .tag(Tab.Cart)
                
            }
            
            HStack(spacing: 0) {
                
                ForEach(Tab.allCases, id: \.self) {tab in
                    
                    Button {
                        
                        currentTab = tab
                        if tab.rawValue != "Home", sharedData.showDetailProduct {
                            withAnimation(.spring()){sharedData.showDetailProduct.toggle()}
                        }
                        
                    } label: {
                        
                        if tab.rawValue == "Cart" {
                            
                            ZStack {
                                
                                Image(tab.rawValue)
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
                                
                                if cartManager.CartProducts.count > 0 {
                                    Text("\(cartManager.CartProducts.count)")
                                        .font(.caption2).bold()
                                        .foregroundColor(.white)
                                        .frame(width: 15, height: 15)
                                        .background(
                                            Color(hue: 1.0, saturation: 0.89, brightness: 0.835)
                                        )
                                        .cornerRadius(50)
                                        .padding(.top, -17)
                                        .padding(.trailing, -18)
                                }
                            }
                        } else {
                            Image(tab.rawValue)
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
                        }
                    }
                }
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 10)
        }
        
    }
}

enum Tab: String, CaseIterable {
    
    case Home = "Home"
    case Liked = "Liked"
    case Search = "Search"
    case Cart = "Cart"
}

struct Main_Page_Previews: PreviewProvider {
    static var previews: some View {
        Main_Page()
            .environmentObject(CartManager())
            .environmentObject(DetailDataModel())
            .environmentObject(BougiesModelView())
    }
}
