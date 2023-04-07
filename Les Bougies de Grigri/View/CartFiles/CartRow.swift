//
//  CartRow.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 16/03/2023.
//

import SwiftUI

struct CartRow: View {
    
    var item: Bougies
    var body: some View {
        
        HStack(spacing: 20) {
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("\(item.title)")
                    .bold()
                Text("$ \(item.price)")
            }
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color.white
                .cornerRadius(15)
                .shadow(radius: 5)
                
        )
        
        
    }
}                 
