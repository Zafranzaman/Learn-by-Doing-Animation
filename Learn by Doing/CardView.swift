//
//  CardView.swift
//  Learn by Doing
//
//  Created by Zafran on 01/07/2024.
//

import SwiftUI

struct CardView: View {
  // MARK: - PROPERTIES
  
  var card: Card
  
  @State private var fadeIn: Bool = false
  @State private var moveDownward: Bool = false
  @State private var moveUpward: Bool = false
  @State private var showAlert: Bool = false
  
  var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
  
  // MARK: - CARD
  
  var body: some View {
    ZStack {
//    transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))
      Image(card.imageName)
            .background(Color.clear)
            .transition(.scale)
        .opacity(fadeIn ? 1.0 : 0.0)
      
      VStack {
        Text(card.title)
          .font(.largeTitle)
          .fontWeight(.heavy)
          .foregroundColor(Color.white)
          .multilineTextAlignment(.center)
        Text(card.headline)
          .fontWeight(.light)
          .foregroundColor(Color.white)
          .italic()
      }
      .offset(y: moveDownward ? -218 : -300)
      
      Button(action: {
        print("Button was tapped.")
        playSound(sound: "sound-chime", type: "mp3")
        self.hapticImpact.impactOccurred()
        self.showAlert.toggle()
      }) {
        HStack {
          Text(card.callToAction.uppercased())
            .fontWeight(.heavy)
            .foregroundColor(Color.white)
            .accentColor(Color.white)
          
          Image(systemName: "arrow.right.circle")
            .font(Font.title.weight(.medium))
            .accentColor(Color.white)
        }
        .padding(.vertical)
        .padding(.horizontal, 24)
        .background(gradientBackgroundColorsView(gradientColors: card.gradientColors,startPoint: .leading,endPoint: .trailing))
        .clipShape(Capsule())
        .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
      }
      .offset(y: moveUpward ? 210 : 300)
    }
    .frame(width: 335, height: 545)
    .background(gradientBackgroundColorsView(gradientColors: card.gradientColors,startPoint: .top,endPoint: .bottom))
    .cornerRadius(16)
    .onAppear() {
      withAnimation(.linear(duration: 1.2)) {
        self.fadeIn.toggle()
      }
      withAnimation(.linear(duration: 0.6)) {
        self.moveDownward.toggle()
        self.moveUpward.toggle()
      }
    }
    .alert(isPresented: $showAlert) {
      Alert(
        title: Text(card.title),
        message: Text(card.message),
        dismissButton: .default(Text("OK"))
      )
    }
  }
}

#Preview {
    CardView(card: cardData[0])
}

struct gradientBackgroundColorsView: View {
    var gradientColors: [Color]
    var startPoint: UnitPoint
    var endPoint: UnitPoint
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: startPoint, endPoint: endPoint)
    }
}
