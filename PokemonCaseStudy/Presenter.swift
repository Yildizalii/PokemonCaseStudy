//
//  Presenter.swift
//  PokemonCaseStudy
//
//  Created by Ali on 2.12.2022.
//

import Foundation

enum NetworkError: Error {
  case NetworkFailed
  case ParsingFailed
}

protocol PokemonListPresenter {
  var router: AnyRouter? {get set}
  var interactor: PokemonListInteractor? {get set}
  var view: PokemonListView? {get set}
  
  func interactorDidDowlandPokemon(result: Result<PokemonResponse,Error>)
}

class PokemonListPresenterClass: PokemonListPresenter {
  
  var interactor: PokemonListInteractor? {
    didSet {
      interactor?.dowlandPokemontList()
    }
  }
  var router: AnyRouter?
  var view: PokemonListView?
  
  func interactorDidDowlandPokemon(result: Result<PokemonResponse, Error>) {
    switch result {
    case .success(let pokemon):
      //view.update
      
      view?.update(with: pokemon)
      print("update")
    case .failure(_):
      //view.uptade.error break
      print("update ")
    }
  }
}
