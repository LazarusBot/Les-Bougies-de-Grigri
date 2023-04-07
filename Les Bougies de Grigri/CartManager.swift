//
//  CartManager.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 20/03/2023.
//

import Foundation

class CartManager: ObservableObject {
    
    @Published private(set) var products: [Bougies] = []
    @Published private(set) var CartProducts: [Bougies] = []
    @Published private(set) var total: Int = 0
    
    func addToLiked(product: Bougies) {
        products.append(product)
    }
    
    func removeToLiked(product: Bougies) {
        products = products.filter { $0.id != product.id}
    }
    
    func addToCart(product: Bougies) {
        CartProducts.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Bougies) {
        CartProducts = CartProducts.filter { $0.id != product.id }
        total -= product.price
        
        if CartProducts.isEmpty {
            total = 0
        }
    }
}

