//
//  ContentView.swift
//  Shared
//
//  Created by Azu on 17/07/2021.
//

import SwiftUI

struct ContentView: View {
    let colors = Gradient(colors: [.red, .yellow, .blue, .purple])
    
    var body: some View {
        Circle()
            .fill(linearGradient())
            .frame(width: 300, height: 300)
    }
    
    
    // MARK: Gradient Helpers. Just for Demo
    private func radialGraidient() -> RadialGradient {
        return RadialGradient(gradient: colors, center: .leading, startRadius: 0, endRadius: 300)
    }
    
    private func angularGradient() -> AngularGradient {
        return AngularGradient(gradient: colors, center: .center)
    }
    
    private func linearGradient() -> LinearGradient {
        return LinearGradient(gradient: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}


struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.closeSubpath()
            
        }
    }
    

}

struct StrokeFillView: View {
    var body: some View {
        Circle()
            .fill(Color.pink)
            .overlay(
                Circle()
                    .stroke(lineWidth: 5)
                    .foregroundColor(.purple)
            )
            .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
