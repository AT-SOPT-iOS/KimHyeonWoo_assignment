import UIKit
import SnapKit
import Then

final class FooterCell: UICollectionViewCell {
    static let identifier = "FooterCell"
    
    private let container = UIView().then {
        $0.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        $0.layer.cornerRadius = 8
    }
    private let badgeLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    private let messageLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 14)
        $0.numberOfLines = 1
    }
    private let arrowImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(container)
        container.addSubview(badgeLabel)
        container.addSubview(messageLabel)
        container.addSubview(arrowImageView)
        
        container.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
        badgeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.centerY.equalToSuperview()
        }
        messageLabel.snp.makeConstraints {
            $0.leading.equalTo(badgeLabel.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
        }
        arrowImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(16)
        }
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func configure(with item: FooterItem) {
        badgeLabel.text      = item.badge
        messageLabel.text    = item.message
        arrowImageView.image = UIImage(named: item.arrowImageName)
    }
}
