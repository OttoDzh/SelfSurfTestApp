//
//  ViewController.swift
//  SelfSurfTestApp
//
//  Created by Otto Dzhandzhuliya on 02.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainVCView()
    var presenter: MainPresenter?
    var skills = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        self.title = "Профиль"
        presenter = MainPresenter(view: self)
        presenter?.getSkills()
        mainView.profileSkillCollection.delegate = self
        mainView.profileSkillCollection.dataSource = self
        addTargets()
    }
    
    func addTargets() {
        mainView.skillsEditButton.addTarget(self, action: #selector(didTapped), for: .touchUpInside)
    }
 
    @objc func didTapped() {
        presenter?.didTappedButton(button: self.mainView.skillsEditButton,collection: self.mainView.profileSkillCollection)
    }

}

extension MainViewController: MainPresenterIn {

    func presentSkills(skills: [String]) {
        DispatchQueue.main.async {
            self.skills = skills
            self.mainView.profileSkillCollection.reloadData()
        }
    }
    
}

extension MainViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        skills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainView.profileSkillCollection.dequeueReusableCell(withReuseIdentifier: MainSkillCollectionCell.reuseId, for: indexPath) as! MainSkillCollectionCell
        cell.skill.text = self.skills[indexPath.row]
        cell.layer.cornerRadius = 12
        if skills.last == "+" {
            cell.deleteSkillButton.isHidden = false
            if indexPath.row == skills.count - 1 {
                cell.deleteSkillButton.isHidden = true
            }
        } else {
            cell.deleteSkillButton.isHidden = true
        }
        cell.btnTapAction = {
            self.skills.remove(at: indexPath.row)
            FethDataService.saveData(skills: self.skills)
            DispatchQueue.main.async {
                self.mainView.profileSkillCollection.reloadData()
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == skills.count - 1 && skills.last == "+" {
            let alertController = UIAlertController(title: "Добавление навыка", message: "Введите название навыка которым владеете", preferredStyle: .alert)
            
            alertController.addTextField {(textfield: UITextField!) -> Void in
                textfield.placeholder = "Введите название"
            }
            let saveAction = UIAlertAction(title: "Добавить", style: .default, handler: { alert -> Void in
                let firsTexField = alertController.textFields![0] as UITextField
                Helper.tamicOff(views: [firsTexField])
               firsTexField.translatesAutoresizingMaskIntoConstraints = false
                print("City name: \(firsTexField)")
                guard let skill = firsTexField.text else {return}
                DispatchQueue.main.async {
                    self.skills.insert(skill, at: self.skills.count - 1)
                    FethDataService.saveData(skills: self.skills)
                    self.mainView.profileSkillCollection.reloadData()
                }
            })
            let cancelAction = UIAlertAction(title: "отмена", style: .destructive)
            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true)
        }
   }
//    
    
}

