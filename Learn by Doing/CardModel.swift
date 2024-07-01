//
//  CArdModel.swift
//  Learn by Doing
//
//  Created by Zafran on 01/07/2024.
//

import Foundation
import SwiftUI

// MARK: - CARD MODEL

struct Card: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var imageName: String
  var callToAction: String
  var message: String
  var gradientColors: [Color]
}
