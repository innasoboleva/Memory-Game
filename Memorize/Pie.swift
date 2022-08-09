//
//  Pie.swift
//  Memorize
//
//  Created by Inna Soboleva on 7/27/22.
//

import SwiftUI

struct Pie: Shape {
    var startingAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startingAngle.radians)),
            y: center.y + radius * CGFloat(sin(startingAngle.radians))
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startingAngle, endAngle: endAngle, clockwise: !clockwise)
        
        p.addLine(to: center)
        return p
    }
    
}
