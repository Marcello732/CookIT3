//
//  Network.swift
//  CookIT
//
//  Created by Macbook on 11/11/2022.
//

import SwiftUI

class Network: ObservableObject {
    @Published var users: [User] = []
}

func getUsers() {
    guard let url = URL(string: "localhost:8080/users") else { fatalError("Missing URL") }

    let urlRequest = URLRequest(url: url)

    let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        if let error = error {
            print("Request error: ", error)
            return
        }

        guard let response = response as? HTTPURLResponse else { return }

        if response.statusCode == 200 {
            guard let data = data else { return }
            DispatchQueue.main.async {
                do {
                    let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                    self.users = decodedUsers
                } catch let error {
                    print("Error decoding: ", error)
                }
            }
        }
    }

    dataTask.resume()
}
