import UIKit
import SnapKit
import Then

/// 메뉴 전용 CollectionViewController
final class MenuCollectionViewController: UIViewController {

    private let items = MenuModel.dummy

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumInteritemSpacing = 16
            $0.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
            $0.itemSize = CGSize(width: 60, height: 24 + 4 + 2)
            // label(24) + spacing(4) + underline(2)
        }
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .black
        cv.showsHorizontalScrollIndicator = false
        cv.allowsSelection = true
        cv.register(MenuItemCell.self,
                    forCellWithReuseIdentifier: MenuItemCell.identifier)
        cv.dataSource = self
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension MenuCollectionViewController: UICollectionViewDataSource {

    func collectionView(_ cv: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ cv: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(
            withReuseIdentifier: MenuItemCell.identifier,
            for: indexPath
        ) as! MenuItemCell

        let menuItem = items[indexPath.item]
        cell.configure(with: menuItem)  // ← model 버전에 맞춰 호출
        return cell
    }
}
