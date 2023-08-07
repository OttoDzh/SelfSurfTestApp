//
//  MainVCView.swift
//  SelfSurfTestApp
//
//  Created by Otto Dzhandzhuliya on 02.08.2023.
//

import UIKit

class MainVCView: UIView {
    
    let scrollView = UIScrollView()
    let contenView = UIView()
    let profileImage = UIImageView()
    let profileName = UILabel(text: "Dzhandzhulia Otto Omarievich", font: ODFonts.titleLabelFont)
    let profilePosition = UILabel(text: "Junior Ios-Developer,for 3-months", font: ODFonts.avenirLight)
    let profileCityImage = UIImageView()
    let profileCity = UILabel(text: "Moscow", font: ODFonts.avenirLight)
    let skillsLabel = UILabel(text: "Мои навыки", font: ODFonts.regulatTextFont)
    var skillsEditButton = UIButton()
    var profileSkillCollection : UICollectionView!
    let aboutMeLabel = UILabel(text: "О себе", font: ODFonts.regulatTextFont)
    let aboutMeText = UITextView()
    
    init(){
        super.init(frame: CGRect())
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        
        backgroundColor = .white
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        
        profileImage.contentMode = .scaleAspectFill
        profileImage.clipsToBounds = true
        profileImage.image = UIImage(named: "ava")
        profileImage.layer.cornerRadius = 80
        
        profileName.numberOfLines = 3
        profileName.textAlignment = .center
        
        profilePosition.textAlignment = .center
        
        profileCityImage.image = UIImage(systemName: "map")
        profileCityImage.tintColor = .lightGray

        skillsEditButton.setBackgroundImage(UIImage(systemName: "pencil"), for: .normal)
        skillsEditButton.tintColor = .black
        
        profileSkillCollection = UICollectionView(frame: CGRect(), collectionViewLayout: creaCompositionalLayoutForSkill())
        profileSkillCollection.register(MainSkillCollectionCell.self, forCellWithReuseIdentifier: MainSkillCollectionCell.reuseId)
        
        aboutMeLabel.numberOfLines = 10
        
        aboutMeText.text = "Hello, im Otto! I'm a novice in Ios and i'm working hard"
        aboutMeText.font = ODFonts.avenirRoman

    }
    
    func setupConstraints() {
        
        let stack = UIStackView(arrangedSubviews: [profileCityImage,profileCity], axis: .horizontal, spacing: 1)
        
        Helper.tamicOff(views: [scrollView,contenView,profileImage,profileName,profilePosition,stack,skillsLabel,skillsEditButton,profileSkillCollection,aboutMeLabel,aboutMeText])
        
        addSubview(scrollView)
        scrollView.addSubview(contenView)
        contenView.addSubview(profileImage)
        contenView.addSubview(profileName)
        contenView.addSubview(profilePosition)
        contenView.addSubview(stack)
        contenView.addSubview(skillsLabel)
        contenView.addSubview(skillsEditButton)
        contenView.addSubview(profileSkillCollection)
        contenView.addSubview(aboutMeLabel)
        contenView.addSubview(aboutMeText)
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo:topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        NSLayoutConstraint.activate([contenView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contenView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     contenView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contenView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contenView.widthAnchor.constraint(equalTo: widthAnchor)])
       
        NSLayoutConstraint.activate([profileImage.topAnchor.constraint(equalTo: contenView.topAnchor, constant: 50),
                                     profileImage.centerXAnchor.constraint(equalTo: contenView.centerXAnchor),
                                     profileImage.widthAnchor.constraint(equalToConstant: 160),
                                     profileImage.heightAnchor.constraint(equalToConstant: 160)])
        
        NSLayoutConstraint.activate([profileName.centerXAnchor.constraint(equalTo: contenView.centerXAnchor),
                                     profileName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
                                     profileName.widthAnchor.constraint(equalToConstant: 200),
                                     profileName.heightAnchor.constraint(equalToConstant: 64)])
        
        NSLayoutConstraint.activate([profilePosition.centerXAnchor.constraint(equalTo: contenView.centerXAnchor),
                                     profilePosition.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 20),
                                     profilePosition.widthAnchor.constraint(equalTo: contenView.widthAnchor)])
        
        NSLayoutConstraint.activate([stack.centerXAnchor.constraint(equalTo: contenView.centerXAnchor),
                                     stack.topAnchor.constraint(equalTo: profilePosition.bottomAnchor, constant: 5)])
        
        NSLayoutConstraint.activate([skillsLabel.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 30),
                                     skillsLabel.leadingAnchor.constraint(equalTo: contenView.leadingAnchor, constant: 12)])
        
        NSLayoutConstraint.activate([skillsEditButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 30),
                                     skillsEditButton.trailingAnchor.constraint(equalTo: contenView.trailingAnchor, constant: -20),
                                     skillsEditButton.widthAnchor.constraint(equalToConstant: 30),
                                     skillsEditButton.heightAnchor.constraint(equalToConstant: 30)])
        
        NSLayoutConstraint.activate([profileSkillCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                                     profileSkillCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                                     profileSkillCollection.heightAnchor.constraint(equalToConstant: 250),
                                     profileSkillCollection.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([aboutMeLabel.topAnchor.constraint(equalTo: profileSkillCollection.bottomAnchor, constant: 24),
                                     aboutMeLabel.leadingAnchor.constraint(equalTo: contenView.leadingAnchor, constant: 16),
                                     aboutMeLabel.heightAnchor.constraint(equalToConstant: 30)])
        
        NSLayoutConstraint.activate([aboutMeText.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 4),
                                     aboutMeText.leadingAnchor.constraint(equalTo: contenView.leadingAnchor, constant: 12),
                                     aboutMeText.trailingAnchor.constraint(equalTo: contenView.trailingAnchor, constant: -12),
                                     aboutMeText.heightAnchor.constraint(equalToConstant: 200),
                                     aboutMeText.bottomAnchor.constraint(equalTo: contenView.bottomAnchor)])
    }
    
    private func creaCompositionalLayoutForSkill() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout(section: creatSkill())
        return layout
    }
    
    private func creatSkill() -> NSCollectionLayoutSection {
        //Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(80),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), // ???
                                               heightDimension: .absolute(56))
      //  let groups = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        let groups = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let spacing = CGFloat(12)
        groups.interItemSpacing = .fixed(spacing)
        groups.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0)
        //Section
        let section = NSCollectionLayoutSection(group: groups)
        return section
        
    }
     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
