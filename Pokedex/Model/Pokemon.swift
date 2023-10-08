//
//  Pokemon.swift
//  Pokedex
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 07/10/23.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let height: String
    let weight: String
    let category: String
    let type: String
    let weaknesses: String
    let urlImage: String
    let model3D: String
}
