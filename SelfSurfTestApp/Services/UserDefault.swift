//
//  UserDefault.swift
//  SelfSurfTestApp
//
//  Created by Otto Dzhandzhuliya on 03.08.2023.
//

import Foundation

class FethDataService {
    
    static func saveData(skills:[String]) {
      UserDefaults.standard.set(skills, forKey: "skills")
    }
    
    static func getData() -> [String] {
          let loadedSkills =  UserDefaults.standard.stringArray(forKey: "skills") ?? ["Uikit"]
          return loadedSkills
    }
    
}
