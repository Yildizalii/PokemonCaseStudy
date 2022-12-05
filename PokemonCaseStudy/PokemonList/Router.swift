//
//  Router.swift
//  PokemonCaseStudy
//
//  Created by Ali on 2.12.2022.
//

import Foundation
import UIKit

typealias EntryPoint = PokemonListView & UIViewController

protocol PokemonListRouter {
  var entry: EntryPoint? {get }
  static func startExcution() -> PokemonListRouter
}

class PokemonListRouterClass: PokemonListRouter {
  
  var entry: EntryPoint?
  
  static func startExcution() -> PokemonListRouter {
    let router = PokemonListRouterClass()
    
    var view: PokemonListView = PokemonListController()
    var prenter: PokemonListPresenter = PokemonListPresenterClass()
    var interactor: PokemonListInteractor = PokemonListInteractorClass()
    
    view.presenter = prenter
    prenter.view = view
    prenter.router = router
    prenter.interactor = interactor
    interactor.presenter = prenter
    router.entry = view as? EntryPoint
    
    return router
  }
}

