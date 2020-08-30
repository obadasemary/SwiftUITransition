//
//  ContentView.swift
//  SwiftUITransition
//
//  Created by Abdelrahman Mohamed on 31.08.2020.
//  Copyright © 2020 Abdelrahman Mohamed. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show = false
    
    var body: some View {
        
        VStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.pink)
                .overlay(
                    Text("Show Details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                )
            
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.yellow)
                    .overlay(
                        Text("Well, here is the details")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                    )
//                    .transition(.scale(scale: 0, anchor: .bottom))
//                    .transition(.offset(x: -600, y: 0))
//                    .transition(AnyTransition.offset(x: -600, y: 0).combined(with: .scale))
//                    .transition(AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity))
                    .transition(.offsetScaleOpacity)
            }
        }
        .onTapGesture {
            withAnimation(Animation.spring()) {
                self.show.toggle()
            }
        }
    }
}

extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
