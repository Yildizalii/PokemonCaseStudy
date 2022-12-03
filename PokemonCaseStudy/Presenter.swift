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


protocol AnyPresenter {
  var router: AnyRouter? {get set}
  var interactor: AnyInteractor? {get set}
  var view: AnyView? {get set}
  
  func interactorDidDowlandPokemon(result: Result<PokemonResponse,Error>)
}

class PokemonListPresenter: AnyPresenter {
  
  var interactor: AnyInteractor? {
    didSet {
      interactor?.dowlandPokemontList()
    }
  }
  var router: AnyRouter?
  var view: AnyView?

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
