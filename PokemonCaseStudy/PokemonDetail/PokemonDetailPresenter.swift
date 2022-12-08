//
//  PokemonDetailPresenter.swift
//  PokemonCaseStudy
//
//  Created by Ali on 4.12.2022.
//

import Foundation


enum DetailNetworkError: Error {
  case NetworkFailed
  case ParsingFailed
}

protocol PokemonDetailPresenterProtocol: AnyObject {
  
  var router: PokemonDetailRouterProtocol? {get set}
  var interactor: PokemonDetailInteractorProtocol? {get set}
  var view: PokemonDetailViewProtocol? {get set}
  
  func interactorDidDownloadPokemonDetail(result: Result< PokemonDetail, Error >)
}

class PokemonDetailPresenter: PokemonDetailPresenterProtocol {
  
  var router: PokemonDetailRouterProtocol?
  weak var view: PokemonDetailViewProtocol?
  
  var interactor: PokemonDetailInteractorProtocol? {
    didSet {
      interactor?.dowloandPokemonDetail()
    }
  }
  
  func interactorDidDownloadPokemonDetail(result: Result<PokemonDetail, Error>) {
    switch result {
    case.success(let pokemonDetail):
      DispatchQueue.main.async {
        self.view?.reloadTableViewData(with: pokemonDetail.abilities)
        self.view?.setNameLabel(pokemonDetail.name)
        self.view?.setImageViewImageURL(pokemonDetail.sprites.front_shiny)
      }
    case.failure(_):
      break
    }
  }
}
