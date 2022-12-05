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

protocol PokemonDetailPresenter {
  
  var router: PokemonDetailRouter? {get set}
  var interactor: PokemonDetailInteractor? {get set}
  var view: PokemonDetailView? {get set}
  
  func interactorDidDownloadPokemonDetail(result: Result< PokemonDetail, Error >)
}

class PokemonDetailPresenterClass: PokemonDetailPresenter {
  
  var router: PokemonDetailRouter?
  
  var interactor: PokemonDetailInteractor?
  
  var view: PokemonDetailView?
  
  
  func interactorDidDownloadPokemonDetail(result: Result<PokemonDetail, Error>) {
    switch result {
    case.success(let detail):
      break
    case.failure(let error):
      break
    }
  }
  
}
