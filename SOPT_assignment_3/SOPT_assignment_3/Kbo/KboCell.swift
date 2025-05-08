import UIKit
import SnapKit
import Then

final class KboCell: UICollectionViewCell {
    static let identifier = "KboCell"

    private let backgroundCard = UIView().then {
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(backgroundCard)
        backgroundCard.addSubview(imageView)

        backgroundCard.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(4)
        }
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(backgroundCard.snp.height).multipliedBy(0.7)
        }
    }

    required init?(coder: NSCoder) { fatalError() }

    /// index 에 따라 배경색을 번갈아 적용합니다.
    func configure(with item: KboItem, at index: Int) {
        imageView.image = UIImage(named: item.logoName)
        // 짝수는 흰색, 홀수는 검은색
        backgroundCard.backgroundColor = (index % 2 == 0) ? .white : .black
    }
}
