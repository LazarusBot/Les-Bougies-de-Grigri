//
//  Item.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 09/03/2023.
//

import SwiftUI

struct Bougies: Identifiable, Hashable {
    
    var id = UUID().uuidString
    var type: ProductType
    var title: String
    var subtitle: String
    var price: Int
    var rating: String
    var image: String
    var quantity: Int = 1
}

enum ProductType: String, CaseIterable {
    
    case Nouveautes = "Nouveautés"
    case Bougies = "Bougies"
    case Fondants = "Fondants"
    case Bruleurs = "Brûleurs"
    
}


