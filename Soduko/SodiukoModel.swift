//  SodiukoModel.swift
//  Soduko
//  Created by Michael Danylchuk on 5/4/24.

import Foundation
import SwiftUI

// MARK: - Welcome
struct SodukoBoard: Codable, Identifiable{
    var id = UUID()
    var newboard: Newboard
    enum CodingKeys: CodingKey {
        case newboard
    }
}

// MARK: - Newboard
struct Newboard: Codable, Identifiable {
    var id = UUID()
    var grids: [Grid]
    var results: Int
    var message: String
    enum CodingKeys: CodingKey {
        case grids
        case results
        case message
    }
}

// MARK: - Grid
struct Grid: Codable, Identifiable {
    var id = UUID()
    var value, solution: [[Int]]
    var difficulty: String
    enum CodingKeys: CodingKey {
        case value
        case solution
        case difficulty
    }
}

