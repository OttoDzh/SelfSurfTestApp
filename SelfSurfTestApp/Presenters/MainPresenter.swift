//
//  MainPresenter.swift
//  SelfSurfTestApp
//
//  Created by Otto Dzhandzhuliya on 02.08.2023.
//

import Foundation
import UIKit

protocol MainPresenterIn: AnyObject {
    func presentSkills(skills: [String])
}

class MainPresenter {
    
    var skills = [String]()
    var editeMode = false
    weak var view: MainPresenterIn?
    
    init(view: MainPresenterIn) {
        self.view = view
    }
    
    func getSkills() {
        let Otto = ProfileModel(name: "Otto",
                                position: "Ios Developer",
                                city: "Moscow",
                                skills: ["MVP/MVVM","DataSource","Snapkit","AutoLayout","CoreData","FireBase"],
                                image: UIImage(named: "ava")!,
                                aboutMe: "Great man")
        
        let loadedSkills = FethDataService.getData()
        
        if loadedSkills.isEmpty {
            self.skills = Otto.skills
            FethDataService.saveData(skills: self.skills)
            self.view?.presentSkills(skills: self.skills)
        } else {
            self.view?.presentSkills(skills: loadedSkills)
        }
       

    }
    
    func didTappedButton(button:UIButton,collection:UICollectionView) {        
        if editeMode == false {
                button.setBackgroundImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                DispatchQueue.main.async {
                    let loadedSkills = FethDataService.getData()
                    self.skills = loadedSkills
                    self.skills.append("+")
                    self.view?.presentSkills(skills: self.skills)
                    collection.reloadData()
                }
            self.editeMode.toggle()
        } else {
                button.setBackgroundImage(UIImage(systemName: "pencil"), for: .normal)
                let loadedSkills = FethDataService.getData()
                self.skills = loadedSkills
                if self.skills.last == "+" {
                    self.skills.removeLast()
                }
            FethDataService.saveData(skills: self.skills)
            self.view?.presentSkills(skills: self.skills)
            collection.reloadData()
            self.editeMode.toggle()
        }
    }
}
