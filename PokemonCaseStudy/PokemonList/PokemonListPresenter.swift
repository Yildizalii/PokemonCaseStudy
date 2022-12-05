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

protocol PokemonListPresenterProtocol: AnyObject {
  var router: PokemonListRouterProtocol? {get set}
  var interactor: PokemonListInteractorProtocol? {get set}
  var view: PokemonListViewProtocol? {get set}
  
  func interactorDidDownloadPokemon(result: Result<PokemonResponse,Error>)
  
}

class PokemonListPresenter: PokemonListPresenterProtocol {
  
  var interactor: PokemonListInteractorProtocol? {
    didSet {
      interactor?.dowlandPokemontList()
    }
  }
  var router: PokemonListRouterProtocol?
  weak var view: PokemonListViewProtocol?
  
  func interactorDidDownloadPokemon(result: Result<PokemonResponse, Error>) {
    switch result {
    case .success(let pokemon):
      view?.update(with: pokemon)
    case .failure(_):
      break
    }
  }
}
