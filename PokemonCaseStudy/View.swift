//
//  View.swift
//  PokemonCaseStudy
//
//  Created by Ali on 2.12.2022.
//

import Foundation
import UIKit
protocol AnyView {
  
  var presenter: AnyPresenter? {get set}

  func update(with pokemon: PokemonResponse )
  func uptade(with error: String)
}


class PokemonListController: UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource{
  
  var pokemonList: [Pokemon] = []
  
  private let tableView: UITableView = {
    let table = UITableView()
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    table.isHidden = true
    return table
    
  }()
  
  private let messageLabel: UILabel = {
    let label = UILabel()
    label.isHidden = false
    label.text = "Dowloading..."
    label.font = UIFont.systemFont(ofSize: 25)
    label.textColor = .black
    label.textAlignment = .center
    return label
  }()
  
  override func viewDidLoad() {
    view.backgroundColor = .yellow
     super.viewDidLoad()
    view.addSubview(tableView)
    view.addSubview(messageLabel)
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
    messageLabel.frame = CGRect(x: view.frame.width / 2 - 100  , y: view.frame.height / 2 - 25  , width: 200, height: 50)
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pokemonList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    var content = cell.defaultContentConfiguration()
    content.text = pokemonList[indexPath.row].name
    cell.contentConfiguration = content
    cell.backgroundColor = .yellow
    return cell
    
  }
  
  func update(with pokemon: PokemonResponse) {
    DispatchQueue.main.async {
      self.pokemonList = pokemon.results
      self.messageLabel.isHidden = true
      self.tableView.reloadData()
      self.tableView.isHidden = false
      
    }
  }
  
  func uptade(with error: String) {
    DispatchQueue.main.async {
      self.pokemonList = []
      self.tableView.isHidden = true
      self.messageLabel.text = error
      self.messageLabel.isHidden = false
    }
    
  }
  
  var presenter: AnyPresenter?
  
}


