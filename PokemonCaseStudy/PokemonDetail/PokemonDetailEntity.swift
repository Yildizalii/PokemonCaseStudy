//
//  PokemonDetailEntity.swift
//  PokemonCaseStudy
//
//  Created by Ali on 4.12.2022.
//

import Foundation

struct PokemonDetail: Decodable {
  
  var abilities: [Info]
}

struct Info: Decodable {
  var ability: Ability
  var is_hidden: Bool
  var slot: Int
}

struct Ability: Decodable {
  var name: String
  var url: URL
}





