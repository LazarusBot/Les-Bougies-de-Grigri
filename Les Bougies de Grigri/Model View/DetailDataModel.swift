//
//  DetailDataModel.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 20/03/2023.
//

import SwiftUI

class DetailDataModel: ObservableObject {
    
    // Detail Product Data
    @Published var detailProduct: Bougies?
    @Published var showDetailProduct: Bool = false
    
    //From SearchView
    @Published var fromSearchPage: Bool = false
    
    
    // Liked Products
    @Published private(set) var likedProducts: [Bougies] = []
    
    func addToLiked(product: Bougies) {
        likedProducts.append(product)
    }
    
    // Cart Products
    @Published var cartProducts: [Bougies] = []
    
    func getTotalPrice()-> String {
        
        var total:Int = 0
        
        cartProducts.forEach { product in
            
            let price = product.price
            let quantity = product.quantity
            let priceTotal = quantity * price
            
            total += priceTotal
        }
        return "$ \(total)"
    }
}

