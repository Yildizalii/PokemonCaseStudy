//
//  PokemonDetailEntity.swift
//  PokemonCaseStudy
//
//  Created by Ali on 4.12.2022.
//

import Foundation

struct PokemonDetail: Decodable {
  
  var abilities: [Ability]
  var name: String
  var sprites: Image
}

struct Ability: Decodable {
  var ability: AbilityInfo
  var is_hidden: Bool
  var slot: Int
}

struct AbilityInfo: Decodable {
  var name: String
  var url: URL
}

struct Image: Decodable {
  var front_shiny: URL
}





