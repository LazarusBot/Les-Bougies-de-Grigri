//
//  TabButton.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 09/03/2023.
//

import SwiftUI

struct TabButton: View {
    var animation: Namespace.ID
    var title: String
    @Binding var selected: String
    
    var body: some View {
        
        Button {
            withAnimation(.spring()){selected = title}
        } label: {
            Text(title)
                .font(.system(size: (selected == title ? 16 : 12)))
                .foregroundColor(selected == title ? .white : .black)
                .padding(.vertical, 10)
                .padding(.horizontal, selected == title ? 15 : 0)
                .background(
                    
                    ZStack {
                        if selected == title {
                            Color.black
                                .clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                    
                )
        }
    }
}

