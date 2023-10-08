//
//  Pokemon3DModelView.swift
//  Pokedex
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 07/10/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Pokemon3DModelView: View {
    @ObservedObject var pokedexViewModel: PokedexViewModel
    var body: some View {
        RealityView { content in
            if let pokemon = try? await Entity(named: (pokedexViewModel.currentPokemon?.model3D ?? "bulbasaur"), in: realityKitContentBundle) {
                content.add(pokemon)
            }
        }
    }
}
