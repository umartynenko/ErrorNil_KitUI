import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
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
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)

        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.imageView.image = UIImage(named: images[indexPath.item])
        cell.titleLabel.text = titles[indexPath.item]
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
                    return CGSize.zero
                }
        
        let width: CGFloat = 200
        let height: CGFloat = collectionView.bounds.height - layout.sectionInset.top - layout.sectionInset.bottom

        return CGSize(width: width, height: height)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // реализован эффект параллакса для ячеек: при прокрутке изменяется масштаб изображения и заголовка ячейки
        // в зависимости от их позиции относительно центра scrollView.
        let centerX = scrollView.contentOffset.x + (scrollView.frame.size.width / 2)
        
        for cell in collectionView.visibleCells as! [ImageCell] {
            let basePosition = cell.center.x - centerX
            let scale = min(max(1 - abs(basePosition / scrollView.frame.size.width), 0.75), 1.0)
            cell.setScale(scale)
        }
    }
}

class ImageCell: UICollectionViewCell {
    let imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIImageView())
    
    let titleLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textAlignment = .center
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [imageView, titleLabel].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(lessThanOrEqualTo: contentView.heightAnchor, multiplier: 0.8),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setScale(_ scale: CGFloat) {
        imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        titleLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}
