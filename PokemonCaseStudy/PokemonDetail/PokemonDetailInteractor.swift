//
//  PokemonDetailInteractor.swift
//  PokemonCaseStudy
//
//  Created by Ali on 4.12.2022.
//

import Foundation

protocol PokemonDetailInteractorProtocol {
  
  var presenter: PokemonDetailPresenterProtocol? {get set}
  
  func dowloandPokemonDetail()
}
class PokemonDetailInteractor: PokemonDetailInteractorProtocol {
  
  var presenter: PokemonDetailPresenterProtocol?
  
  func dowloandPokemonDetail() {
    guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/ditto") else {
      return
    }
    let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
      guard let data = data, error == nil else {
        self?.presenter?.interactorDidDownloadPokemonDetail(result: .failure(NetworkError.NetworkFailed))
        return
      }
      do {
        let detail = try JSONDecoder().decode(PokemonDetail.self, from: data)
        self?.presenter?.interactorDidDownloadPokemonDetail(result: .success(detail))
      }catch {
        self?.presenter?.interactorDidDownloadPokemonDetail(result: .failure(NetworkError.ParsingFailed))
      }
    }
    task.resume()
  }
  
}
