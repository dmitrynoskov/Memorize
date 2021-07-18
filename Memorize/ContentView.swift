//
//  ContentView.swift
//  Memorize
//
//  Created by Dmitry on 17.07.2021.
//

import SwiftUI

struct ContentView: View {
    let vehicles = ["🚗", "🚎", "🚜", "✈️", "🚂", "🚁", "🛥", "🚢", "🏎", "🚕", "🚛", "🚑", "🛻", "🛴", "🏍", "🚲"]
    let animals = ["🐶", "🐼", "🐱", "🐸", "🦉", "🐬", "🐕", "🦢", "🐿", "🐢", "🐷", "🐰", "🦊", "🐝"]
    let people = ["👮‍♀️", "👩‍🌾", "👨‍🍳", "👨‍🎓", "👩‍🔧", "👩‍🚀", "👰‍♀️", "👸"]
    
    @State var emojis: [String]
    @State var emojiCount: Int
    
    init() {
        self.emojis = vehicles
        self.emojiCount = Int.random(in: 4...vehicles.count)
    }
    
    var body: some View {
        VStack {
            Text("Memorize")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                themeVehicles
                Spacer()
                themePeople
                Spacer()
                themeAnimals
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var themeVehicles: some View {
        VStack {
            Button {
                emojis = vehicles.shuffled()
                emojiCount = Int.random(in: 4...emojis.count)
            } label : {
                Image(systemName: "car.fill")
            }
            Text("Vehicles").font(.body)
        }
    }
    
    var themePeople: some View {
        VStack {
            Button {
                emojis = people.shuffled()
                emojiCount = Int.random(in: 4...emojis.count)
            } label : {
                Image(systemName: "person.2.fill")
            }
            Text("People").font(.body)
        }
    }
    
    var themeAnimals: some View {
        VStack {
            Button {
                emojis = animals.shuffled()
                emojiCount = Int.random(in: 4...emojis.count)
            } label : {
                Image(systemName: "tortoise.fill")
            }
            Text("Animals").font(.body)
        }
    }
    
//    var remove: some View {
//        Button {
//            if (emojiCount > 1) {
//                emojiCount -= 1
//            }
//        } label: {
//            VStack {
//                Image(systemName: "minus.circle")
//            }
//        }
//    }
//
//    var add: some View {
//        Button {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            VStack {
//                Image(systemName: "plus.circle")
//            }
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
        
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
