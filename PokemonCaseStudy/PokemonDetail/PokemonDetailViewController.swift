//
//  PokemonDetailViewController.swift
//  PokemonCaseStudy
//
//  Created by Ali on 4.12.2022.
//

import UIKit


protocol PokemonDetailView {
  
  var presenter: PokemonDetailPresenter? {get set}
  
  func update(with pokemonDetail: [PokemonDetail])
  func update(with error: String)
}

class PokemonDetailViewController: UIViewController, PokemonDetailView {
  
  var presenter: PokemonDetailPresenter?
  var pokemonDetail: [PokemonDetail] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  func update(with pokemonDetail: [PokemonDetail]){
    self.pokemonDetail = pokemonDetail
  }
  
  func update(with error: String) {
    
  }
}
