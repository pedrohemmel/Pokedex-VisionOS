//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 07/10/23.
//

import SwiftUI

@main
struct PokedexApp: App {
    @StateObject var pokedexViewModel = PokedexViewModel()
    var body: some Scene {
        WindowGroup {
            PokedexView(pokedexViewModel: pokedexViewModel)
        }
        
        WindowGroup(id: "Pokemon3DModel") {
            Pokemon3DModelView(pokedexViewModel: pokedexViewModel)
        }
        .windowStyle(.volumetric)
        
        ImmersiveSpace(id: "PokedexImmersive") {
            PokedexImmersiveView()
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
