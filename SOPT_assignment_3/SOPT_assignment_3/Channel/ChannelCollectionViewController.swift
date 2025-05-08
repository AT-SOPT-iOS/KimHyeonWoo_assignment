import UIKit
import SnapKit
import Then

final class ChannelCollectionViewController: UIViewController {

    private let items = ChannelModel.dummy

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection    = .horizontal
            $0.minimumLineSpacing = 16
            $0.sectionInset       = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            $0.itemSize           = CGSize(width: 120, height: 160)
        }
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor                = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(ChannelCell.self,
                    forCellWithReuseIdentifier: ChannelCell.identifier)
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

extension ChannelCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ cv: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ cv: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(
            withReuseIdentifier: ChannelCell.identifier,
            for: indexPath
        ) as! ChannelCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
}
