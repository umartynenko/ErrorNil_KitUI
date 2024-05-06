//
//  ViewController.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 01.05.2024.
//

import UIKit
import LoremSwiftum



class ViewController: UIViewController {
    private let collectionData = SectionCollections.mocData()
    
    var tabBarViewController: TabBarViewController?
    
    lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.reuseID)
        $0.register(EventsCollectionViewCell.self, forCellWithReuseIdentifier: EventsCollectionViewCell.reuseID)
        $0.register(UsersCollectionViewCell.self, forCellWithReuseIdentifier: UsersCollectionViewCell.reuseID)
        $0.register(
            MainNewsHeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: MainNewsHeaderCollectionReusableView.reuseId
        )
        $0.register(
            MainNewsFooterCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: MainNewsFooterCollectionReusableView.reuseId
        )
        $0.register(
            MainEventsHeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: MainEventsHeaderCollectionReusableView.reuseId
        )
        $0.register(
            MainUsersHeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: MainUsersHeaderCollectionReusableView.reuseId
        )
        $0.backgroundColor = .appColorViewGray
        $0.delegate = self
        
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: createLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        if let tabBarVC = self.tabBarController as? TabBarViewController {
            tabBarVC.passcollectionDataToMessagesViewController(data: collectionData)
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
                case 0:
                    self.createNewsSection()
                case 1:
                    self.createEventsSection()
                default:
                    self.createUsersSection()
            }
        }
    }
    
    private func createNewsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.75), heightDimension: .estimated(161))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 30, bottom: 11, trailing: 10)
        section.boundarySupplementaryItems = [self.createHeaderNewsSize(), self.createFooterSize()]
        
        return section
    }
    
    private func createEventsSection() -> NSCollectionLayoutSection {
        let itemsSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemsSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .estimated(51))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 30, bottom: 61, trailing: 15)
        section.boundarySupplementaryItems = [self.createHeaderNewsSize()]
        
        
        return section
    }
    
    private func createUsersSection() -> NSCollectionLayoutSection {
        let itemsSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemsSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(213), heightDimension: .estimated(173))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 30, bottom: 24, trailing: 10)
        section.boundarySupplementaryItems = [self.createHeaderNewsSize()]
        
        return section
    }
    
    private func createHeaderNewsSize() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(24)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
    }
    
    private func createFooterSize() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footer = NSCollectionLayoutBoundarySupplementaryItem (
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(28)),
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
        footer.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: -61, trailing: 0)
        
        return footer
    }
}


extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionData[indexPath.section].items[indexPath.item]
        
        switch indexPath.section {
            case 0:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: NewsCollectionViewCell.reuseID,
                    for: indexPath
                ) as! NewsCollectionViewCell
                cell.setupCell(item: item)
                
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: EventsCollectionViewCell.reuseID,
                    for: indexPath
                ) as! EventsCollectionViewCell
                cell.setupCell(item: item)
                
                return cell
            case 2:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: UsersCollectionViewCell.reuseID,
                    for: indexPath
                ) as! UsersCollectionViewCell
                cell.setupCell(item: item)
                
                return cell
            default:
                return UICollectionViewCell()
        }
    }
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let item = collectionData[indexPath.section]
        
        switch indexPath.section {
            case 0:
                switch kind {
                    case UICollectionView.elementKindSectionHeader:
                        let header = collectionView.dequeueReusableSupplementaryView(
                            ofKind: kind,
                            withReuseIdentifier: MainNewsHeaderCollectionReusableView.reuseId,
                            for: indexPath
                        ) as! MainNewsHeaderCollectionReusableView
                        header.setupHeader(header: item.header)
                        header.block = {
                            print(indexPath)
                        }
                        
                        return header
                    case UICollectionView.elementKindSectionFooter:
                        let footer = collectionView.dequeueReusableSupplementaryView(
                            ofKind: kind,
                            withReuseIdentifier: MainNewsFooterCollectionReusableView.reuseId,
                            for: indexPath
                        ) as! MainNewsFooterCollectionReusableView
                        footer.setupFooter(footer: Lorem.sentence)
                        
                        return footer
                    default:
                        return UICollectionReusableView()
                }
            case 1:
                switch kind {
                    case UICollectionView.elementKindSectionHeader:
                        let header = collectionView.dequeueReusableSupplementaryView(
                            ofKind: kind,
                            withReuseIdentifier: MainEventsHeaderCollectionReusableView.reuseId,
                            for: indexPath
                        ) as! MainEventsHeaderCollectionReusableView
                        header.setupHeader(header: item.header)
                        header.block = {
                            print(indexPath)
                        }
                        
                        return header
                    default:
                        return UICollectionReusableView()
                }
            default :
                switch kind {
                    case UICollectionView.elementKindSectionHeader:
                        let header = collectionView.dequeueReusableSupplementaryView(
                            ofKind: kind,
                            withReuseIdentifier: MainUsersHeaderCollectionReusableView.reuseId,
                            for: indexPath
                        ) as! MainUsersHeaderCollectionReusableView
                        header.setupHeader(header: item.header)
                        header.block = {
                            print(indexPath)
                        }
                        
                        return header
                    default:
                        return UICollectionReusableView()
                }
        }
    }
}
