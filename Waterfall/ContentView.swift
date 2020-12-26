//
//  ContentView.swift
//  Waterfall
//
//  Created by Mat Louis on 12/25/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            HStack(spacing: 16) {
                VStack {
                    /* Refresher on enumerated and offset */
                    ForEach(Array(leftCards.enumerated()), id: \.element) { offset, card in
                        CardView(card: card)
                            .frame(height: offset % 2 == 0 ? 320 : 200)
                    }
                }
                VStack {
                    ForEach(Array(rightCards.enumerated()), id: \.element) { offset, card in
                        CardView(card: card)
                            .frame(height: offset % 2 != 0 ? 320 : 200)
                    }
                }
            }.padding()
        }
    }
}

/* Custom Views! */
struct CardView: View {
    let card: Card
    var body: some View {
        GeometryReader { proxy in
        Image(card.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: proxy.size.width, height: proxy.size.height)
            .clipped()
            .overlay(RoundedRectangle(cornerRadius: 10).fill(Color(.gray).opacity(0.33)))
        }
    }
}

struct Card: Hashable {
    let title: String
    let imageName: String
}

let leftCards: [Card] = [
    .init(title: "Ferrari", imageName: "ferrari"),
    .init(title: "Ford", imageName: "ford"),
    .init(title: "Lambo2", imageName: "lambo2"),
    .init(title: "Jesko", imageName: "jesko"),
]


let rightCards: [Card] = [
    .init(title: "Benz", imageName: "benz"),
    .init(title: "Dodge", imageName: "dodge"),
    .init(title: "Ducati", imageName: "ducati"),
    .init(title: "Lambo", imageName: "lambo"),
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

