import UIKit
import SnapKit
import Then

final class PDCell: UICollectionViewCell {
    static let identifier = "PDCell"

    private let imageView = UIImageView().then {
        $0.contentMode   = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 4
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    required init?(coder: NSCoder) { fatalError() }

    func configure(with model: PDItem) {
        imageView.image = UIImage(named: model.imageName)
    }
}
