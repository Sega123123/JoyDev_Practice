
import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Consts
    
    private enum Consts{
        static let titleFontSize = UIFont.systemFont(ofSize: 15)
        static let categoryFontSize = UIFont.systemFont(ofSize: 12)
        static let costFontSize = UIFont.systemFont(ofSize: 20)
        static let imageTopAnchorConstantMultiply = 0.1
        static let imageWidthAnchorConstantMultiply = 0.8
        static let imageHeightAnchorConstantMultiply = 0.6
        static let titleTopAnchorConstant = CGFloat(10)
        static let titleHeightAnchorConstant = CGFloat(20)
        static let categoryTopAnchorConstant = CGFloat(10)
        static let categoryHeightAnchorConstant = CGFloat(20)
        static let costTopAnchorConstant = CGFloat(5)
        static let costBottomAnchorConstantMultiply = -0.1
        static let layerCornerRadius = CGFloat(5)
        static let layerShadowRadius = CGFloat(9)
        static let layerShadowOpacity = Float(0.3)
        static let layerShadowOffset = CGSize(width: 5, height: 8)
    }
    
    // MARK: - Internal properties
    
    let mainImageView: UIImageView = { // изображение товара
        let imageView = UIImageView()
        return imageView
    }()
    
    let itemTitle: UILabel = { // наименование товара
        let lable = UILabel()
        lable.textColor = .black
        lable.font = Consts.titleFontSize
        lable.textAlignment = .center
        return lable
    }()
    
    let itemCategory: UILabel = { // описание товара
        let lable = UILabel()
        lable.textColor = .black
        lable.font = Consts.categoryFontSize
        lable.textAlignment = .center
        return lable
    }()
    
    let itemCost: UILabel = { // цена товара
        let lable = UILabel()
        lable.textColor = .black
        lable.font = Consts.costFontSize
        lable.textAlignment = .center
        return lable
    }()
    
    // MARK: - Internal Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(mainImageView)
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainImageView.topAnchor.constraint(equalTo: topAnchor, constant: frame.width * Consts.imageTopAnchorConstantMultiply),
            mainImageView.widthAnchor.constraint(equalToConstant: frame.width * Consts.imageWidthAnchorConstantMultiply),
            mainImageView.heightAnchor.constraint(equalToConstant: frame.height * Consts.imageHeightAnchorConstantMultiply)
        ])
        
        addSubview(itemTitle)
        itemTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            itemTitle.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: Consts.titleTopAnchorConstant),
            itemTitle.widthAnchor.constraint(equalTo: mainImageView.widthAnchor),
            itemTitle.heightAnchor.constraint(equalToConstant: Consts.titleHeightAnchorConstant)
        ])
        
        addSubview(itemCategory)
        itemCategory.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemCategory.centerXAnchor.constraint(equalTo: centerXAnchor),
            itemCategory.topAnchor.constraint(equalTo: itemTitle.bottomAnchor, constant: Consts.categoryTopAnchorConstant),
            itemCategory.widthAnchor.constraint(equalTo: mainImageView.widthAnchor),
            itemCategory.heightAnchor.constraint(equalToConstant: Consts.categoryHeightAnchorConstant)
        ])
        
        addSubview(itemCost)
        itemCost.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemCost.centerXAnchor.constraint(equalTo: centerXAnchor),
            itemCost.topAnchor.constraint(equalTo: itemCategory.bottomAnchor, constant: Consts.costTopAnchorConstant),
            itemCost.widthAnchor.constraint(equalTo: mainImageView.widthAnchor),
            itemCost.bottomAnchor.constraint(equalTo: bottomAnchor, constant: frame.width * Consts.costBottomAnchorConstantMultiply)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = Consts.layerCornerRadius
        self.layer.shadowRadius = Consts.layerShadowRadius
        layer.shadowOpacity = Consts.layerShadowOpacity
        layer.shadowOffset = Consts.layerShadowOffset
        self.clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
