//
//  PokemonDetailRouter.swift
//  PokemonCaseStudy
//
//  Created by Ali on 4.12.2022.
//

import Foundation
import UIKit


protocol PokemonDetailRouterProtocol {
  
  static func startExcution(pokemonDetailURL: URL) -> UIViewController
  
}
class PokemonDetailRouter: PokemonDetailRouterProtocol {
  
  static func startExcution(pokemonDetailURL: URL) -> UIViewController {
    let router = PokemonDetailRouter()
    
    let storyboard = UIStoryboard(name: "Detail", bundle: nil)
    let customViewController = storyboard.instantiateViewController(withIdentifier: "PokemonDetail") as! PokemonDetailViewController
    
    var view: PokemonDetailViewProtocol = customViewController
    let presenter: PokemonDetailPresenterProtocol = PokemonDetailPresenter()
    var interactor: PokemonDetailInteractorProtocol = PokemonDetailInteractor(pokemon: pokemonDetailURL)
    
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    interactor.presenter = presenter
    presenter.interactor = interactor
    
    return customViewController
  }
}
