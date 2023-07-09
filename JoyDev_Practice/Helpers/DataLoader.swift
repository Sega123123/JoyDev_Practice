//
//  DataLoader.swift
//  JoyDev_Practice
//
//  Created by  ProveY0urW0rth on 09.07.2023.
//

import Foundation

final class DataLoader{
    static let shared = DataLoader()
    
    func jsonGet() -> Profile{
        let url = Bundle.main.url(forResource: "profileData", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        let profile = try? decoder.decode(Profile.self, from: data)
        return profile!
    }
}
