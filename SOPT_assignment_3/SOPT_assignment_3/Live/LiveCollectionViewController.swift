// LiveCollectionViewController.swift

import UIKit
import SnapKit
import Then

final class LiveCollectionViewController: UIViewController {

    private let items: [LiveItem] = LiveModel.dummy

    private let headerLabel = UILabel().then {
        $0.text = "실시간 인기 LIVE"
        $0.textColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 18)
               ?? .boldSystemFont(ofSize: 18)
    }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection      = .horizontal
            $0.minimumLineSpacing   = 16
            $0.sectionInset         = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            $0.itemSize             = CGSize(width: 200, height: 180)
        }
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor                = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(LiveCell.self, forCellWithReuseIdentifier: LiveCell.identifier)
        cv.dataSource = self
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        view.addSubview(headerLabel)
        view.addSubview(collectionView)

        headerLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(30)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(0)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(160)
            $0.bottom.equalToSuperview()
        }
    }
}

extension LiveCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ cv: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ cv: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(
            withReuseIdentifier: LiveCell.identifier,
            for: indexPath
        ) as! LiveCell
        cell.configure(with: items[indexPath.item], rank: indexPath.item + 1)
        return cell
    }
}
