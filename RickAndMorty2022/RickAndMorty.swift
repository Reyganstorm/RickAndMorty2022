//
//  RickAndMorty.swift
//  RickAndMorty2022
//
//  Created by Руслан Штыбаев on 23.04.2022.
//

import Foundation

enum Links: String {
    case rickAndMortyApi = "https://rickandmortyapi.com/api/character"
}

struct RickAndMorty: Decodable {
    let info: Info
    let results: [Character]
}

struct Info: Decodable {
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Decodable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let location: Location
    let image: String
    let episode: [String]
}

struct Location: Decodable {
    let name: String
}

