
import UIKit
import Moya
import Kingfisher

class CarouselCollectionView: UICollectionView {
    
    // MARK: - Consts
    
    private enum Consts {
        static let cellReuseIdentifier = "CarouselCollectionViewCell"
        static let leftDistanceToView: CGFloat = 40
        static let rightDistanceToView: CGFloat = 40
        static let flowLayoutMinimumLineSpacing: CGFloat = 15
        static let frameHeightMultiply = 0.7
        static let flowLayoutItemWidth = (UIScreen.main.bounds.width - Consts.leftDistanceToView - Consts.rightDistanceToView - (Consts.flowLayoutMinimumLineSpacing / 2)) / 2
    }
    
    // MARK: - Private properties
    
    private let layout = UICollectionViewFlowLayout()
    
    // MARK: - Internal Methods
    
    init() {
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: Consts.cellReuseIdentifier)
        layout.minimumLineSpacing = Consts.flowLayoutMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: Consts.leftDistanceToView, bottom: 0, right: Consts.rightDistanceToView)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - extensions

extension CarouselCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Consts.flowLayoutItemWidth, height: frame.height * Consts.frameHeightMultiply)
    }
}
