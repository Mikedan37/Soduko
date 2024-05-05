//  SodiukoModel.swift
//  Soduko
//  Created by Michael Danylchuk on 5/4/24.

import Foundation
import SwiftUI

// MARK: - Welcome
struct SodukoBoard: Codable, Identifiable{
    var id = UUID()
    let newboard: Newboard
    enum CodingKeys: CodingKey {
        case newboard
    }
}

// MARK: - Newboard
struct Newboard: Codable, Identifiable {
    var id = UUID()
    let grids: [Grid]
    let results: Int
    let message: String
    enum CodingKeys: CodingKey {
        case grids
        case results
        case message
    }
}

// MARK: - Grid
struct Grid: Codable, Identifiable {
    var id = UUID()
    let value, solution: [[Int]]
    let difficulty: String
    enum CodingKeys: CodingKey {
        case value
        case solution
        case difficulty
    }
}

