import UIKit
import SnapKit
import Then

/// 메뉴 항목을 표시할 Cell
final class MenuItemCell: UICollectionViewCell {
    static let identifier = "MenuItemCell"

    private let titleLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
               ?? .systemFont(ofSize: 16, weight: .medium)
        $0.textAlignment = .center
    }

    private let underlineView = UIView().then {
        $0.backgroundColor = .white
        $0.isHidden = true
    }

    override var isSelected: Bool {
        didSet {
            underlineView.isHidden = !isSelected
            titleLabel.textColor = isSelected
                ? .white
                : UIColor(white: 1, alpha: 0.6)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        contentView.addSubview(underlineView)

        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(24)
        }
        underlineView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(titleLabel)
            $0.height.equalTo(2)
        }
    }

    required init?(coder: NSCoder) { fatalError() }

    // ← 여기를 model 버전으로!
    func configure(with model: MenuItem) {
        titleLabel.text = model.title
    }
}
