import UIKit
import SnapKit
import Then

/// 실시간 인기 영화 전용 CollectionViewController
final class MovieCollectionViewController: UIViewController {

    // MARK: — Model
    private let items = MovieModel.dummy

    // MARK: — Header
    private let headerLabel = UILabel().then {
        $0.text = "실시간 인기 영화"
        $0.textColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 18) ?? .boldSystemFont(ofSize: 18)
    }

    // MARK: — CollectionView
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection    = .horizontal
            $0.minimumLineSpacing = 12
            $0.sectionInset       = UIEdgeInsets(top: 2, left: 16, bottom: 0, right: 16)
            $0.itemSize           = CGSize(width: 120, height: 180)
        }
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor                = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(MovieCell.self,
                    forCellWithReuseIdentifier: MovieCell.identifier)
        cv.dataSource = self
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        // Add header and collection view
        view.addSubview(headerLabel)
        view.addSubview(collectionView)

        // Layout
        headerLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(30)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(180)
            $0.bottom.equalToSuperview()
        }
    }
}

// MARK: — UICollectionViewDataSource
extension MovieCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ cv: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ cv: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(
            withReuseIdentifier: MovieCell.identifier,
            for: indexPath
        ) as! MovieCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
}
