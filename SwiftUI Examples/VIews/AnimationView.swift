//
//  AnimationView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 10/14/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct AnimationView: View {
    
    @State var movePlane = true
    @State private var isAnimating = true

    @State private var moveArrow: Bool = false

    @State private var half = false
    @State private var dim = false
    

    
    var body: some View {
        VStack (alignment: .leading){
                        
            Spacer()
            
            Button(action: {
                print("Tap tap")
            }) {
                Text("Rent a space")
            }
            .buttonStyle(GradientBackgroundStyle())
//            .modifier(PrimaryButtonStyle())
//            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
//            Group {
//                Image(systemName: "paperplane")
//                    .font(.system(size: 40))
//                    .offset(y: -50)
//                    .rotationEffect(.degrees(movePlane ? 0 : 360))
//    //                .move
//    //                .rotationEffect(.degrees(360))
//                    .animation(
//                        Animation.linear(duration: 2)
//                        .repeatForever(autoreverses: false)
//                    )
//                    .transition(.move(edge: .bottom))
//                    .onAppear(){
//                        self.movePlane.toggle()
//                    }
//
//                Spacer()
//
//                Image(systemName: "bolt")
//                    .font(.system(size: 40))
//                    .padding()
//                    .scaleEffect(half ? 0.5 : 1.0)
//                    .opacity(dim ? 0.2 : 1.0)
//                    .animation(.easeInOut(duration: 1.0))
//                    .onTapGesture {
//                        self.dim.toggle()
//                        self.half.toggle()
//                    }
//
//                Spacer()
//
//                Image(systemName: "heart.fill")
//                    .font(.system(size: 40))
//                    .padding()
//                    .scaleEffect(isAnimating ? 0.7 : 1.0)
//                    .animation(
//                        Animation.linear(duration: 0.8)
//                            .repeatForever(autoreverses: true)
//                    )
//                    .onAppear() {
//                        self.isAnimating.toggle()
//                    }
//
//            }
            
            Spacer()
            
            HStack {
                Image(systemName: "arrowtriangle.right.fill")
                    .padding()
                    .offset(x: self.moveArrow ? 80 : 0)

                Image(systemName: "arrowtriangle.right.fill")
                    .padding()
                    .offset(x: self.moveArrow ? 60 : 0)

                Image(systemName: "arrowtriangle.right.fill")
                    .padding()
                    .offset(x: self.moveArrow ? 40 : 0)
                
            }
            .font(.system(size: 40))
            .padding()
            .foregroundColor(Color.blue)
            .opacity(0.6)
//            .animation(.easeInOut)
            .animation(
                Animation
//                    .easeInOut(duration: 2)
                    .timingCurve(0.5, 2.5, 0, 0, duration: 2)
                    .repeatForever(autoreverses: true)
//                    .opacity(0.5)
            )
            .onAppear() {
                self.moveArrow.toggle()
            }
                



            
            Spacer()
            
//            Button("Animate"){
//                self.moveArrow.toggle()
//                print(self.moveArrow)
//            }
            
            
        } // VStack
//            .frame(width: 300)
//            .border(Color.orange)
    }
}


extension AnyTransition {
    static func moveAndScale(edge: Edge) -> AnyTransition {
        AnyTransition.move(edge: edge).combined(with: .scale(scale: 3))
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
