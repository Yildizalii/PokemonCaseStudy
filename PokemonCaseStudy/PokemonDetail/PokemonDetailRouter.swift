//
//  PokemonDetailRouter.swift
//  PokemonCaseStudy
//
//  Created by Ali on 4.12.2022.
//

import Foundation
import UIKit


protocol PokemonDetailRouter {
  
  static func startExcution() -> UIViewController
  
}

class PokemonDetailRouterClass: PokemonDetailRouter {
  
  static func startExcution() -> UIViewController {
    let router = PokemonDetailRouterClass()
    
    let storyboard = UIStoryboard(name: "Detail", bundle: nil)
    let customViewController = storyboard.instantiateViewController(withIdentifier: "PokemonDetail") as! PokemonDetailViewController
    
    
    var view: PokemonDetailView = customViewController
    var presenter: PokemonDetailPresenter = PokemonDetailPresenterClass()
    var interactor: PokemonDetailInteractor = PokemonDetailInteractorClass()
    
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    interactor.presenter = presenter
    
    return customViewController
    
  }
  
}
