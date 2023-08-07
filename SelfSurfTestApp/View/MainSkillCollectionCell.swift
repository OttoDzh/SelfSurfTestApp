//
//  MainSkillCollectionCell.swift
//  SelfSurfTestApp
//
//  Created by Otto Dzhandzhuliya on 02.08.2023.
//

import UIKit

class MainSkillCollectionCell: UICollectionViewCell {
    
    static let reuseId = "SkillCell"
    
    let skill = UILabel(text: "Ios", font: ODFonts.avenirLight)
    let deleteSkillButton = UIButton()
    var btnTapAction: (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        backgroundColor = .main
        deleteSkillButton.isHidden = true
        deleteSkillButton.setBackgroundImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        deleteSkillButton.tintColor = .lightGray
        deleteSkillButton.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
    }
    
    @objc func btnTapped() {
        btnTapAction?()
    }
    
    func setupConstraints() {
        
        
        Helper.tamicOff(views: [skill,deleteSkillButton])
        
        addSubview(skill)
        addSubview(deleteSkillButton)
        
        NSLayoutConstraint.activate([skill.heightAnchor.constraint(equalToConstant: 44),
                                     skill.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 38),
                                     skill.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -38),
                                     skill.centerXAnchor.constraint(equalTo: centerXAnchor)
                                    ])
        
        NSLayoutConstraint.activate([deleteSkillButton.leadingAnchor.constraint(equalTo: skill.trailingAnchor, constant: 8),
                                     deleteSkillButton.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
