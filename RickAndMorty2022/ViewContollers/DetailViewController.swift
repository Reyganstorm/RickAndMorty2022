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
    @IBOutlet var containerView: UIView!
    @IBOutlet var descriptionLabel: UILabel!
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 25
        
        containerView.layer.cornerRadius = 25
        containerView.layer.shadowColor = UIColor.darkGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        containerView.layer.shadowRadius = 25.0
        containerView.layer.shadowOpacity = 0.8
        
        
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

