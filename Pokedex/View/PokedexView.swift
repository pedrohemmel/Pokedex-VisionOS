//
//  PokedexView.swift
//  Pokedex
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 07/10/23.
//

import SwiftUI

struct PokedexView: View {
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    @ObservedObject var pokedexViewModel: PokedexViewModel
    
    @State var isShowingImmersiveSpace = false
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 100, content: {
                    ForEach(pokedexViewModel.pokedex) { pokemon in
                        NavigationLink {
                            PokemonDetailView(pokedexViewModel: pokedexViewModel, pokemon: pokemon)
                        } label: {
                            if let url = URL(string: pokemon.urlImage) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                        .padding()
                                        .background(.white)
                                        .clipShape(Circle())
                                } placeholder: {
                                    Color.white
                                        .frame(width: 200, height: 200)
                                        .clipShape(Circle())
                                }
                            }
                        }
                    }
                })
                .navigationTitle("Pokedex")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Toggle(isShowingImmersiveSpace ? "Dismiss immersive space" : "Open immersive space", isOn: $isShowingImmersiveSpace)
                            .onChange(of: isShowingImmersiveSpace) { _, isShowing in
                                Task {
                                    if isShowing {
                                        await openImmersiveSpace(id: "PokedexImmersive")
                                    } else {
                                        await dismissImmersiveSpace()
                                    }
                                }
                            }
                            .toggleStyle(.button)
                            
                    }
                }
            }
        }
    }
}
