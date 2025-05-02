import UIKit
import SnapKit
import Then

final class PdCollectionViewController: UIViewController {

    private let items = PDModel.dummy
    
    private let headerLabel = UILabel().then {
        $0.text = "김가현PD의 인생작 TOP 5"
        $0.textColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 18)
               ?? .boldSystemFont(ofSize: 18)
    }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection    = .horizontal
            $0.minimumLineSpacing = 12
            $0.sectionInset       = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            $0.itemSize           = CGSize(width: 120, height: 180)
        }
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor                = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(PDCell.self,
                    forCellWithReuseIdentifier: PDCell.identifier)
        cv.dataSource = self
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        view.addSubview(headerLabel)
        headerLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(30)
        }
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(180)
            $0.bottom.equalToSuperview()
        }
    }
}

extension PdCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ cv: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ cv: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(
            withReuseIdentifier: PDCell.identifier,
            for: indexPath
        ) as! PDCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
}
