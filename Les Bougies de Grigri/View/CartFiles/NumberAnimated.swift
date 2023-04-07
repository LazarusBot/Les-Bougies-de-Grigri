//
//  NumberAnimated.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 23/03/2023.
//

import SwiftUI


struct NumberAnimated: View {
    // Change 1: number is now a Double
    @State var number: Int = 0

    var body: some View {
        VStack(spacing: 20) {
            // Change 2: we have a container with our modifier applied
            Color.clear
                .frame(width: 50, height: 50)
                .animatingOverlay(for: number)
            Button {
                withAnimation {
                    number = .random(in: 0 ..< 200)
                }
            } label: {
                Text("Create random number")
            }
        }
    }
}

struct NumberAnimated_Previews: PreviewProvider {
    static var previews: some View {
        NumberAnimated()
    }
}
