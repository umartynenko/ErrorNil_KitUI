//
//  ViewController.swift
//  ErrorNil_UIKit_HW11
//
//  Created by Юрий Мартыненко on 01.05.2024.
//

import UIKit


class ViewController: UIViewController {
    private let collectionData = SectionCollections.mocData()
    
    lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.reuseID)
        
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: createLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
                default:
                    self.createNewsSection()
            }
        }
    }
    
    private func createNewsSection() -> NSCollectionLayoutSection {
        
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
        UICollectionViewCell()
    }
}
