//
//  CharacterImageView.swift
//  RickAndMorty2022
//
//  Created by Руслан Штыбаев on 23.04.2022.
//

import UIKit

class CharacterImageView: UIImageView {
    func fetchImage(from url: String) {
        guard let url = URL(string: url) else {
            image = UIImage(named: "anonim")
            return
        }
        
        if let cachedImage = getCachedImage(from: url) {
            image = cachedImage
            return
        }
        
        ImageManager.shared.fetchImage(from: url) { data, response in
            self.image = UIImage(data: data)
            self.saveDataToCache(with: data, and: response)
        }
    }
    
    private func saveDataToCache(with data: Data, and response: URLResponse) {
        guard let url = response.url else { return }
        let request = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: request)
    }

    private func getCachedImage(from url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
}
    
