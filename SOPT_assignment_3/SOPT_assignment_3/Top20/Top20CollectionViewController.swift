import UIKit
import SnapKit
import Then

final class Top20CollectionViewController: UIViewController {

    private let items: [Top20Item] = Top20Model.dummy

    private let headerLabel = UILabel().then {
        $0.text = "오늘의 티빙 TOP 20"
        $0.textColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 18)
               ?? .boldSystemFont(ofSize: 18)
    }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 60
            $0.sectionInset = UIEdgeInsets(top: 0, left: 16 + 30, bottom: 0, right: 16)
            $0.itemSize = CGSize(width: 120, height: 180)
        }
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .black
        cv.showsHorizontalScrollIndicator = false
        cv.clipsToBounds = false
        cv.register(Top20Cell.self, forCellWithReuseIdentifier: Top20Cell.identifier)
        cv.dataSource = self
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        view.addSubview(headerLabel)
        view.addSubview(collectionView)

        headerLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(30)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(180)
        }
    }
}

extension Top20CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ cv: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {items.count}

    func collectionView(_ cv: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(
            withReuseIdentifier: Top20Cell.identifier,
            for: indexPath
        ) as! Top20Cell
        let item = items[indexPath.item]
        cell.configure(with: item,
                       rank: indexPath.item + 1)
        return cell
    }
}
