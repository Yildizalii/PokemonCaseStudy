//
//  PokemonDetailViewController.swift
//  PokemonCaseStudy
//
//  Created by Ali on 4.12.2022.
//

import UIKit
import AlamofireImage


protocol PokemonDetailViewProtocol: AnyObject {
  
  var presenter: PokemonDetailPresenterProtocol? {get set}
  
  func setNameLabel(_ name: String)
  func setImageViewImageURL(_ url: URL)
  func reloadTableViewData(with pokemonDetail: [Ability])
}

class PokemonDetailViewController: UIViewController, PokemonDetailViewProtocol, UITableViewDataSource, UITableViewDelegate{
    
  var pokemonDetailList: [Ability] = []
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var pokemonImageView: UIImageView!
  @IBOutlet weak var pokemonDetailTableView: UITableView!
  
  var presenter: PokemonDetailPresenterProtocol?
  var pokemonDetail: [PokemonDetail] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    pokemonDetailTableView.delegate = self
    pokemonDetailTableView.dataSource = self

  }
  
  func reloadTableViewData(with pokemonDetail: [Ability]){
    
    self.pokemonDetailList = pokemonDetail
    self.pokemonDetailTableView.reloadData()
  }
  
  func setImageViewImageURL(_ url: URL) {
    pokemonImageView.af.setImage(withURL: url)
  }
  
  func setNameLabel(_ name: String) {
    nameLabel.text = name.uppercased()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pokemonDetailList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = pokemonDetailList[indexPath.row].ability.name
    return cell
  }

}
