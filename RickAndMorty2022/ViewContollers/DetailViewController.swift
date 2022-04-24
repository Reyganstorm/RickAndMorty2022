//
//  DetailViewController.swift
//  RickAndMorty2022
//
//  Created by Руслан Штыбаев on 23.04.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: CharacterImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 25
        
        nameLabel.text = character.name
        imageView.fetchImage(from: character.image)
        descriptionLabel.text =
        """
        Species: \(character.species)
        
        Gender: \(character.gender)
        
        Status: \(character.status)
        
        Last location: \(character.location.name)
        
        Number of episodes: \(character.episode.count)
        """
    }
}

