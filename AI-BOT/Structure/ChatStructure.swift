//
//  ChatStructure.swift
//  AI-BOT
//
//  Created by Subhan Qamar on 04/10/2024.
//

import Foundation
struct ChatStructure: Identifiable, Equatable ,Codable {
    let id = UUID()
    let message: String
    let role: String
}
