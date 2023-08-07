//
//  ProfileModel.swift
//  SelfSurfTestApp
//
//  Created by Otto Dzhandzhuliya on 02.08.2023.
//

import Foundation
import UIKit

class ProfileModel {
    let name:String
    let position:String
    let city:String
    let skills: [String]
    let image: UIImage
    let aboutMe:String
    
    init(name: String, position: String, city: String, skills: [String], image: UIImage, aboutMe: String) {
        self.name = name
        self.position = position
        self.city = city
        self.skills = skills
        self.image = image
        self.aboutMe = aboutMe
    }
}
