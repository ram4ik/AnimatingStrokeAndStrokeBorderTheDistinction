//
//  ContentView.swift
//  AnimatingStrokeAndStrokeBorderTheDistinction
//
//  Created by Ramill Ibragimov on 30.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showStroke: Bool = false
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), center: .center, startRadius: 50, endRadius: 500)
                .edgesIgnoringSafeArea(.all)
            
            Capsule()
                .stroke(lineWidth: showStroke ? 1 : 40)
                .frame(width: 180, height: 280)
                .foregroundColor(.orange)
                .animation(Animation.interpolatingSpring(stiffness: 60, damping: 15).delay(1))
                .shadow(color: .orange, radius: 10, x: 0, y: 0)
            
            Circle()
                .frame(width: 70, height: 70)
                .foregroundColor(.orange)
                .shadow(color: .orange, radius: 20, x: 0, y: 0)
                .scaleEffect(showStroke ? 1 : 1.4, anchor: .center)
                .animation(Animation.interpolatingSpring(stiffness: 60, damping: 10).delay(0.8))
                
            Button(action: {
                self.showStroke.toggle()
            }) {
                Image(systemName: "xmark")
                    .font(.largeTitle)
            }
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
