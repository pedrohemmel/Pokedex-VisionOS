//
//  PokedexImmersiveView.swift
//  Pokedex
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 07/10/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct PokedexImmersiveView: View {
    var body: some View {
        RealityView { content in
            if let island = try? await Entity(named: "island", in: realityKitContentBundle) {
                content.add(island)
            }
        }
    }
}
