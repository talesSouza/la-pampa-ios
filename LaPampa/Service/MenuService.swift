//
//  MenuService.swift
//  LaPampa
//
//  Created by Bruno Moreira on 11/08/21.
//

import UIKit

class MenuService {
    
    func getMenu() -> [MenuItem]? {
        
        if let fileURL = Bundle.main.url(forResource: "menu.json", withExtension: nil) {
            do {
                let jsonData = try Data(contentsOf: fileURL)
                return try JSONDecoder().decode([MenuItem].self, from: jsonData)
            } catch {
                print("Error")
            }
        }
        return nil
    }
}
