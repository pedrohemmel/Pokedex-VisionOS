//
//  PokedexViewModel.swift
//  Pokedex
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 07/10/23.
//

import Foundation

class PokedexViewModel: ObservableObject {
    @Published var pokedex = [Pokemon]()
    @Published var currentPokemon: Pokemon?
    
    init () {
        loadPokedex()
    }
    
    func loadPokedex() {
        if let pokedexFile = Bundle.main.path(forResource: "pokedex", ofType: "json") {
            do {
                guard let contentsOfFile = try String(contentsOfFile: pokedexFile).data(using: .utf8) else {
                    print("Could not convert pokedex file to string.")
                    return
                }
                pokedex = try JSONDecoder().decode([Pokemon].self, from: contentsOfFile)
            } catch {
                print("Could not decode pokedex.")
            }
        } else {
            print("Could not find pokedex file.")
        }
    }
}
