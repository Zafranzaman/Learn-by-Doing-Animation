//
//  ContentView.swift
//  Learn by Doing
//
//  Created by Zafran on 01/07/2024.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  
  var cards: [Card] = cardData
  
  // MARK: - CONTENT
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 20) {
        ForEach(cards) { item in
          CardView(card: item)
        }
      }
      .padding(20)
    }
  }
}


#Preview {
    ContentView()
}
