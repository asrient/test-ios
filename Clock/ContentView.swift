//
//  ContentView.swift
//  Clock
//
//  Created by aritra sen on 12/04/20.
//  Copyright © 2020 aritra sen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
       ListView()
    }
}

struct Pokemon: Identifiable {
  let id: Int
  let name: String
  let type: String
  let color: Color
}

struct ListView : View {
    @State private var showAlert: Bool = false
    @State var pokemonList = [
    Pokemon(id: 0, name: "Charmander", type: "Fire", color: .red),
    Pokemon(id: 1, name: "Squirtle", type: "Water", color: .blue),
    Pokemon(id: 2, name: "Bulbasaur", type: "Grass", color: .green),
    Pokemon(id: 3, name: "Pikachu", type: "Electric", color: .yellow),
  ]
  var body: some View {
    NavigationView {
      List(pokemonList) { pokemon in
        HStack {
          Text(pokemon.name)
            Spacer()
          Text(pokemon.type).foregroundColor(pokemon.color)
        }
      }
      .navigationBarTitle(Text("Pokemon"))
      .navigationBarItems(
        trailing: HStack{
            Button(action: {
                    self.showAlert=true
                })
            {
              Text("Cute")
                .font(.headline)
             .fontWeight(.regular)
                .foregroundColor(Color.orange)
                .padding(.trailing)
                }
            Button(action: addPokemon, label: { Text("Add")
                .foregroundColor(Color.orange)
            })
        }
      )
    }
    .sheet(isPresented: $showAlert) {
        VStack() {
        Text("Cuteness")
        .font(.title)
            .padding(.bottom,30)
          Button(action: {
         self.showAlert=false
          }) {
           Text("Close")
               .font(.headline)
               .fontWeight(.regular)
              .foregroundColor(Color.red)
            }
            
        }
        }  }
  func addPokemon() {
    if let randomPokemon = pokemonList.randomElement() {
      pokemonList.append(randomPokemon)
    }
  }
}

struct preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
