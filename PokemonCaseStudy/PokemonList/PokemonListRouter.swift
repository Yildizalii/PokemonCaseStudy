//
//  Router.swift
//  PokemonCaseStudy
//
//  Created by Ali on 2.12.2022.
//

import Foundation
import UIKit

typealias EntryPoint = PokemonListViewProtocol & UIViewController

protocol PokemonListRouterProtocol {
  var entry: EntryPoint? {get }
  static func startExcution() -> PokemonListRouterProtocol
}

class PokemonListRouter: PokemonListRouterProtocol {
  
    var entry: EntryPoint?
  
    static func startExcution() -> PokemonListRouterProtocol {
    
    let router = PokemonListRouter()
    let view: PokemonListViewProtocol = PokemonListViewController()
    let prenter: PokemonListPresenterProtocol = PokemonListPresenter()
    var interactor: PokemonListInteractorProtocol = PokemonListInteractor()
    
    view.presenter = prenter
    prenter.view = view
    prenter.router = router
    prenter.interactor = interactor
    interactor.presenter = prenter
    router.entry = view as? EntryPoint
    
    return router
  }
}

