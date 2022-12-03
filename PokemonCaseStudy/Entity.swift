//
//  Entity.swift
//  PokemonCaseStudy
//
//  Created by Ali on 2.12.2022.
//

import Foundation

struct Pokemon: Decodable {
  
  var name: String
  var url: URL
}

struct PokemonResponse: Decodable {
  var results: [Pokemon]
}

struct Info: Decodable {
  var ability: Ability
  var is_hidden: Bool
  var slot: Int
}

struct Ability : Decodable {
  var name: String
  var url: URL
}
