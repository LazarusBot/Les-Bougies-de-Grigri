//
//  CustomShape.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 11/03/2023.
//

import SwiftUI

struct CustomShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path {path in
            
            let pt1 = CGPoint(x: rect.width, y: 60)
            let pt2 = CGPoint(x: 0, y: rect.height - 220)
            let pt3 = CGPoint(x: 0, y: rect.height)
            let pt4 = CGPoint(x: rect.width, y: rect.height)
            
            path .move(to: pt4)
            
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 20)
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 20)
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 20)
            path.addArc(tangent1End: pt4, tangent2End: pt1, radius: 20)
        }
    }
}


