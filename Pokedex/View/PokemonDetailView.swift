//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 07/10/23.
//

import SwiftUI

struct PokemonDetailView: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    @ObservedObject var pokedexViewModel: PokedexViewModel
    
    @State private var isShowing3DModel = false
    
    var pokemon: Pokemon
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text(pokemon.description)
                            .foregroundStyle(.blue)
                        Group {
                            HStack {
                                Text("Height")
                                Spacer()
                                Text(pokemon.height)
                            }
                            HStack {
                                Text("Weight")
                                Spacer()
                                Text(pokemon.weight)
                            }
                            HStack {
                                Text("Category")
                                Spacer()
                                Text(pokemon.category)
                            }
                            HStack {
                                Text("Type")
                                Spacer()
                                Text(pokemon.type)
                            }
                            HStack {
                                Text("Weaknesses")
                                Spacer()
                                Text(pokemon.weaknesses)
                            }
                        }
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                    }
                    .frame(width: reader.size.width * 0.5)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    Spacer()
                    VStack {
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
                        Toggle(isShowing3DModel ? "Dismiss 3D Model" : "Open 3D Model", isOn: $isShowing3DModel)
                            .onChange(of: isShowing3DModel) { _, isShowing in
                                if isShowing {
                                    openWindow(id: "Pokemon3DModel")
                                } else {
                                    dismissWindow(id: "Pokemon3DModel")
                                }
                            }
                            .toggleStyle(.button)
                            .tint(.white)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                }
                Spacer()
            }
            .onDisappear {
                if isShowing3DModel {
                    dismissWindow(id: "Pokemon3DModel")
                    isShowing3DModel = false
                }
                pokedexViewModel.currentPokemon = nil
            }
            .onAppear {
                pokedexViewModel.currentPokemon = pokemon
            }
        }
    }
}
