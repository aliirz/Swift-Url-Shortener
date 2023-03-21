//
//  BitlyViewModel.swift
//  shortenswift
//
//  Created by Ali Raza on 3/21/23.
//

import SwiftUI
import Alamofire

class BitlyViewModel: ObservableObject {
    @Published var shortURL: String = ""
    let bitlyAPIKey = "YOUR_BITLY_API_KEY"

    func shortenURL(url: String) {
        guard !url.isEmpty else {
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(bitlyAPIKey)",
            "Content-Type": "application/json"
        ]

        let parameters: Parameters = [
            "long_url": url
        ]

        AF.request("https://api-ssl.bitly.com/v4/shorten", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any], let shortURL = json["link"] as? String {
                    DispatchQueue.main.async {
                        self.shortURL = shortURL
                    }
                }
            case .failure(_):
                // Handle error
                break
            }
        }
    }
}
