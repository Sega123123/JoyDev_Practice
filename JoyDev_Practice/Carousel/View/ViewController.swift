
import UIKit
import Moya
import Kingfisher

class ViewController: UIViewController {
    
    // MARK: - Consts
    
    private enum Consts{
        static let collectionViewHeightAnchorConstantMultiply = 0.5
        static let cellReuseIdentifier = "CarouselCollectionViewCell"
        static let frameHeightMultiply = 0.7
        static let flowLayoutItemWidth = (UIScreen.main.bounds.width - 80 - (15 / 2)) / 2
    }
    
    // MARK: - Private properties
    
    private var carouselCollectionView = CarouselCollectionView()
    private var viewModel = ItemListViewModel()
    private let itemProvider = MoyaProvider<ItemService>()

    // MARK: - Internal Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(carouselCollectionView)
        carouselCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carouselCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            carouselCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            carouselCollectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            carouselCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * Consts.collectionViewHeightAnchorConstantMultiply)
        ])
        carouselCollectionView.dataSource = self
        carouselCollectionView.delegate = self

        viewModel.items.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.carouselCollectionView.reloadData()
            }
        }
        
        fetchData() // загрузка данных
    }
    
    // MARK: - Private Methods
    
    private func fetchData(moreData: Bool = false) {
        itemProvider.request(moreData ? .getMoreItems : .getItems) { (result) in
            switch result {
            case .success(let response):
                let items = try! JSONDecoder().decode([ItemModel].self, from: response.data)
                
                self.viewModel.items.value = items.compactMap({
                    ItemListCellViewModel(image: $0.image, title: $0.title, category: $0.category, price: $0.price)
                })
                self.carouselCollectionView.reloadData()

            case .failure(let error):
                print(error)
            }
        }
    }
}

    //MARK: - extensions

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Consts.cellReuseIdentifier, for: indexPath) as! CarouselCollectionViewCell
        cell.itemCategory.text = viewModel.items.value?[indexPath.row].category
        cell.itemTitle.text = viewModel.items.value?[indexPath.row].title
        cell.itemCost.text = String((viewModel.items.value?[indexPath.row].price)!)
        cell.mainImageView.kf.indicatorType = .activity
        cell.mainImageView.kf.setImage(with: URL(string: (viewModel.items.value?[indexPath.row].image)!))
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Consts.flowLayoutItemWidth, height: carouselCollectionView.frame.height * Consts.frameHeightMultiply)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        visibleRect.origin = carouselCollectionView.contentOffset
        visibleRect.size = carouselCollectionView.bounds.size
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let indexPath = carouselCollectionView.indexPathForItem(at: visiblePoint) else { return }
        if (indexPath.row + 1) % 10 == 0 && viewModel.items.value?.count == (indexPath.row + 1) {
            fetchData(moreData: true) // подгрузка остальных данных
        }
    }
}

