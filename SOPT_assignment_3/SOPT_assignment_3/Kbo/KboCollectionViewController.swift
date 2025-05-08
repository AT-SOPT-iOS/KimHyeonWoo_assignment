import UIKit
import SnapKit
import Then

final class KboCollectionViewController: UIViewController {
    private let items = KboModel.dummy

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection      = .horizontal
            $0.minimumLineSpacing   = 16
            $0.sectionInset         = .init(top: 0, left: 16, bottom: 0, right: 16)
            $0.itemSize             = .init(width: 140, height: 120)
        }
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor                = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(KboCell.self, forCellWithReuseIdentifier: KboCell.identifier)
        cv.dataSource = self
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension KboCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ cv: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ cv: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(
            withReuseIdentifier: KboCell.identifier,
            for: indexPath
        ) as! KboCell
        let item = items[indexPath.item]
        cell.configure(with: item, at: indexPath.item)
        return cell
    }
}
