//
//  CarouselCell.swift
//  Carousel
//
//  Created by Юрий Мартыненко on 16.05.2024.
//

import UIKit


class ViewController: UIViewController {
    var collectionView: UICollectionView!
    
    let images = [
        "austin-curtis-c3MxFy0Yggo-unsplash",
        "daniil-silantev-XQO0MBtUihk-unsplash",
        "julee-juu-6jkvDsHBTno-unsplash",
        "job-savelsberg-hqdAnzUehno-unsplash",
        "austin-curtis-pJh6jKtzGgk-unsplash"
    ]
    let titles = [
        "Sensoji (Asakusa Kannon Temple) in Tokyo, Japan. September 2023.",
        "The Squirrel",
        "Down syndrome",
        "The solidified lava flows of the Fagradalsfjall volcano near Grindavik, Iceland",
        "Sengan-en in Kagoshima, Japan. October 2023."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let layout = ParalaxFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! CarouselCell
        cell.imageView.image = UIImage(named: images[indexPath.item])
        cell.titleLabel.text = titles[indexPath.item]
        
        return cell
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width: CGFloat = 200
        let height: CGFloat = collectionView.bounds.height
        
        return CGSize(width: width, height: height)
    }
}


extension ViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let layout = collectionView.collectionViewLayout as? ParalaxFlowLayout else { return }
        
        layout.invalidateLayout()
    }
}
