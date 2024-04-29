//
//  ViewController.swift
//  ErrorNil_UIKit_HW10
//
//  Created by Юрий Мартыненко on 29.04.2024.
//

import UIKit


class ViewController: UIViewController {
    private let collectionData = SectionCollections.mockData()
    
    lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.reuseID)
        $0.register(MessageCell.self, forCellWithReuseIdentifier: MessageCell.reuseID)
        
        return $0
    }(UICollectionView(frame: view.frame , collectionViewLayout: createLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout {section, _ in
            switch section {
                case 0:
                    self.createStorySection()
                default:
                    self.createMessageSection()
            }
        }
    }
    
    
    
    private func createStorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .estimated(104))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 10)
        
        return section
    }
    
    private func createMessageSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85), heightDimension: .estimated(98))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 10)
        
        return section
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionData[indexPath.section].items[indexPath.item]
        
        switch indexPath.section {
            case 0:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: StoryCell.reuseID,
                    for: indexPath
                ) as! StoryCell
                cell.setupCell(item: item)
                
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: MessageCell.reuseID,
                    for: indexPath
                ) as! MessageCell
                cell.setupCell(item: item)

                return cell
            default:
                return UICollectionViewCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        collectionData.count
        2
    }
}
