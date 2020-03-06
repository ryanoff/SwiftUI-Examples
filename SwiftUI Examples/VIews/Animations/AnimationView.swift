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
    
    @State private var rotating = false
    
    @State var progressToggle = false
    @State var progressRingEndingValue: CGFloat = 0.75
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Button(action: {
                print("Tap tap")
            }) {
                Text("Rent a space")
            }
            .buttonStyle(GradientBackgroundStyle())
            
            Group {
                
                HStack {
                    Spacer()
                    Image(systemName: "arrow.2.circlepath.circle")
                        .font(.system(size: 40))
                        .rotationEffect(.degrees(rotating ? 360 : 0))
                        .animation(
                            Animation.linear(duration: 1.0)
                                .repeatForever(autoreverses: false)
                    )
                        .onAppear(){
                            self.rotating.toggle()
                    }
                    .padding()
                    
                    Spacer()
                    
                    Circle()
                        .trim(from: 0, to: 0.25)
                        .stroke(Color.green, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                        .background(Circle().stroke(Color.green, lineWidth: 10).opacity(0.2))
                        .frame(width: 100, height: 100)
                        //                    .rotationEffect(.degrees(-90.0))
//                        .rotationEffect(.degrees(rotating ? 360 : 0))
//                        .animation(
//                            Animation.linear(duration: 2.5)
//                                .repeatForever(autoreverses: false)
//                    )
                    
                    Spacer()
                } // HStack
                
                Toggle(isOn: $rotating) { Text("Rotating") }.padding()
            }
            
            Group {
                ZStack{
                    Circle()
                        .trim(from: 0, to: progressToggle ? progressRingEndingValue : 0)
                        .stroke(Color.green, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .background(Circle().stroke(Color.green, lineWidth: 20).opacity(0.2))
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(-90.0))
                        .onAppear() {
                            withAnimation(.easeInOut(duration: 1)) {
                                self.progressToggle.toggle()
                            }
                    }
                    
                    Text("\(Int(progressRingEndingValue * 100)) %")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 1)) {
                        self.progressRingEndingValue = CGFloat.random(in: 0...1)
                    }
                }) { Text("Randomize")
                    .font(.largeTitle)
                    .foregroundColor(Color.green)
                }
            }
            
            
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
                        .repeatForever(autoreverses: false)
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
