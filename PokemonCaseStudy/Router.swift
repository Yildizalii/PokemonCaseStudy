//
//  Router.swift
//  PokemonCaseStudy
//
//  Created by Ali on 2.12.2022.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
  var entry: EntryPoint? {get }
  static func startExcution() -> AnyRouter
}

class PokemonListRouter: AnyRouter {
 
  
  var entry: EntryPoint?
  
 
  static func startExcution() -> AnyRouter {
    let router = PokemonListRouter()
     
    var view: AnyView = PokemonListController()
    var prenter: AnyPresenter = PokemonListPresenter()
    var interactor: AnyInteractor = PokemonListInteractor()
    
    view.presenter = prenter
    prenter.view = view
    prenter.router = router
    prenter.interactor = interactor
    interactor.presenter = prenter
    router.entry = view as? EntryPoint 
    
    return router
  }
  
  
  
}

