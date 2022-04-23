//
//  MainViewController.swift
//  RickAndMorty2022
//
//  Created by Руслан Штыбаев on 23.04.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
    // MARK: - Private propoties
    private var rickAndMorty: RickAndMorty?
    private var characters: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData(from: Links.rickAndMortyApi.rawValue)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rickAndMorty?.results.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let character = rickAndMorty?.results[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = character?.name
        
        
        cell.contentConfiguration = content
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func updateData(_ sender: UIBarButtonItem) {
        sender.tag == 1
            ? fetchData(from: rickAndMorty?.info.next)
            : fetchData(from: rickAndMorty?.info.prev)
    }

    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { result in
            switch result {
            case .success(let rickAndMorty):
                self.rickAndMorty = rickAndMorty
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
