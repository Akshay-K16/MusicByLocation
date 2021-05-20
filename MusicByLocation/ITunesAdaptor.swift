//
//  ITunesAdapter.swift
//  MusicByLocation
//
//  Created by Khemaney, Akshay (SPH) on 20/05/2021.
//

import Foundation

class ITunesAdaptor {
    let baseURL = "https://itunes.apple.com"
    
    func getArtists(_ toSearch: String, completion: @escaping  ([Artist]?) -> Void) {
        let path = "/search?term=\(toSearch)&entity=musicArtist".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: baseURL + path)
        else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data  {
                if let response = self.parseJson(json: data) {
                    completion(response.results)
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Error Decoding JSON")
            return nil
        }
    }
}
