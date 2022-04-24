//
//  MainViewController.swift
//  RickAndMorty2022
//
//  Created by Руслан Штыбаев on 23.04.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
    @IBOutlet var backwardArrow: UIBarButtonItem!
    
    // MARK: - Private propoties
    private var rickAndMorty: RickAndMorty?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: Links.rickAndMortyApi.rawValue)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rickAndMorty?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterViewCell
        let character = rickAndMorty?.results[indexPath.row]
        cell.configure(with: character)
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let character = rickAndMorty?.results[indexPath.row]
        let detailVC = segue.destination as! DetailViewController
        detailVC.character = character
    }
  
    @IBAction func updateData(_ sender: UIBarButtonItem) {
        sender.tag == 1
            ? fetchData(from: rickAndMorty?.info.next)
            : fetchData(from: rickAndMorty?.info.prev)
    }

    private func fetchData(from url: String?) {
        CharacterManager.shared.fetchData(from: url) { result in
            switch result {
            case .success(let rickAndMorty):
                self.rickAndMorty = rickAndMorty
                self.enabledPrevCheck()
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func enabledPrevCheck() {
        if rickAndMorty?.info.prev == nil {
            backwardArrow.isEnabled.toggle()
        } else { backwardArrow.isEnabled = true }
    }
}
