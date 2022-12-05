//
//  PokemonDetailRouter.swift
//  PokemonCaseStudy
//
//  Created by Ali on 4.12.2022.
//

import Foundation
import UIKit


protocol PokemonDetailRouterProtocol {
  
  static func startExcution() -> UIViewController
  
}

class PokemonDetailRouter: PokemonDetailRouterProtocol {
  
  static func startExcution() -> UIViewController {
    let router = PokemonDetailRouter()
    
    let storyboard = UIStoryboard(name: "Detail", bundle: nil)
    let customViewController = storyboard.instantiateViewController(withIdentifier: "PokemonDetail") as! PokemonDetailViewController
    
    
    var view: PokemonDetailViewProtocol = customViewController
    var presenter: PokemonDetailPresenterProtocol = PokemonDetailPresenter()
    var interactor: PokemonDetailInteractorProtocol = PokemonDetailInteractor()
    
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    interactor.presenter = presenter
    
    return customViewController
    
  }
  
}
