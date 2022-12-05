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

protocol PokemonDetailPresenterProtocol {
  
  var router: PokemonDetailRouterProtocol? {get set}
  var interactor: PokemonDetailInteractorProtocol? {get set}
  var view: PokemonDetailViewProtocol? {get set}
  
  func interactorDidDownloadPokemonDetail(result: Result< PokemonDetail, Error >)
}

class PokemonDetailPresenter: PokemonDetailPresenterProtocol {
  
  var router: PokemonDetailRouterProtocol?
  
  var interactor: PokemonDetailInteractorProtocol?
  
  var view: PokemonDetailViewProtocol?
  
  
  func interactorDidDownloadPokemonDetail(result: Result<PokemonDetail, Error>) {
    switch result {
    case.success(let detail):
      break
    case.failure(let error):
      break
    }
  }
  
}
