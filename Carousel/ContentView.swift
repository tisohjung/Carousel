//
//  ContentView.swift
//  Carousel
//
//  Created by minho on 2021/06/10.
//

import SwiftUI

struct ContentView: View {
    var imageName = "iu3"
    var imageTitle = "UI is IU"
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1

        let x = proxy.frame(in: CoordinateSpace.global).minX
        let diff: CGFloat = abs(x)
        if diff < 100 {
            scale = 1 + (100 - diff) / 500
        }

        return scale
    }

    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal) {
                    HStack(spacing: 50) {
                        ForEach(0 ..< 30) { _ in
                            GeometryReader { proxy in

                                NavigationLink(
                                    destination: Image(imageName),
                                    label: {
                                    VStack {
                                        let scale = getScale(proxy: proxy)
                                        Image(imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 150)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1.0)
                                                    .foregroundColor(.blue)
                                            )
                                            .clipped()
                                            .cornerRadius(5)
                                            .shadow(radius: 5)
                                            .scaleEffect(CGSize(width: scale, height: scale))
                                            .animation(.easeOut(duration: 0.5))

                                        Text(imageTitle).padding(.top).multilineTextAlignment(.center)
                                            .foregroundColor(.blue)
                                    }
                                })

//                                Text(num.description)
//                                    .font(.system(size: 30, weight: .bold, design: Font.Design.rounded))
                            }
                            .frame(width: 125, height: 300, alignment: .center)
                        }
                    }.padding(32)
                }
            }.navigationTitle("Carousel")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
