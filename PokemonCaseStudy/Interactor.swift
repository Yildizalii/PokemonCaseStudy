//
//  Interactor.swift
//  PokemonCaseStudy
//
//  Created by Ali on 2.12.2022.
//

import Foundation

protocol PokemonListInteractor {
  
  var presenter: PokemonListPresenter? {get set}
  
  func dowlandPokemontList()
}

class PokemonListInteractorClass: PokemonListInteractor {
  
  var presenter: PokemonListPresenter?
  
  func dowlandPokemontList() {
    guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon")else {
      return
    }
    let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
      guard let data = data, error == nil else {
        self?.presenter?.interactorDidDowlandPokemon(result: .failure(NetworkError.NetworkFailed))
        return
      }
      do {
        let pokemon = try JSONDecoder().decode(PokemonResponse.self, from: data)
        self?.presenter?.interactorDidDowlandPokemon(result: .success(pokemon))
      } catch {
        self?.presenter?.interactorDidDowlandPokemon(result: .failure(NetworkError.ParsingFailed))
        
      }
      
    }
    task.resume()
  }
}
