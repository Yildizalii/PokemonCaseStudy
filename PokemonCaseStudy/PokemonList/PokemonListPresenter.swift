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

protocol PokemonListPresenter: AnyObject {
  var router: PokemonListRouter? {get set}
  var interactor: PokemonListInteractor? {get set}
  var view: PokemonListView? {get set}
  
  func interactorDidDownloadPokemon(result: Result<PokemonResponse,Error>)
  
}

class PokemonListPresenterClass: PokemonListPresenter {
  
  var interactor: PokemonListInteractor? {
    didSet {
      interactor?.dowlandPokemontList()
    }
  }
  var router: PokemonListRouter?
  weak var view: PokemonListView?
  
  func interactorDidDownloadPokemon(result: Result<PokemonResponse, Error>) {
    switch result {
    case .success(let pokemon):
      view?.update(with: pokemon)
    case .failure(_):
      break
    }
  }
}
