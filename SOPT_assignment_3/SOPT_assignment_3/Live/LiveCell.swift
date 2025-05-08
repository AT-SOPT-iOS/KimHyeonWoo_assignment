import UIKit
import SnapKit
import Then

final class LiveCell: UICollectionViewCell {
    static let identifier = "LiveCell"

    private let thumbImageView = UIImageView().then {
        $0.contentMode   = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 4
    }
    private let rankLabel = UILabel().then {
        $0.textColor = .white
        $0.font      = UIFont(name: "Pretendard-Bold", size: 24)
                       ?? .boldSystemFont(ofSize: 24)
    }
    private let titleLabel = UILabel().then {
        $0.textColor = .white
        $0.font      = UIFont(name: "Pretendard-SemiBold", size: 16)
                       ?? .systemFont(ofSize: 16, weight: .semibold)
    }
    private let subtitleLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font      = UIFont.systemFont(ofSize: 12)
    }
    private let percentLabel = UILabel().then {
        $0.textColor = .white
        $0.font      = UIFont.systemFont(ofSize: 12)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(thumbImageView)
        contentView.addSubview(rankLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(percentLabel)

        // Thumbnail at top
        thumbImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        // Rank and Title in a horizontal stack next
        rankLabel.snp.makeConstraints {
            $0.top.equalTo(thumbImageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
        }
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(rankLabel)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(8)
            $0.trailing.lessThanOrEqualToSuperview().inset(8)
        }
        // Subtitle below title
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel)
            $0.trailing.lessThanOrEqualToSuperview().inset(8)
        }
        // Percent below subtitle
        percentLabel.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel)
            $0.trailing.lessThanOrEqualToSuperview().inset(8)
        }
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    func configure(with model: LiveItem, rank: Int) {
        thumbImageView.image = UIImage(named: model.thumbName)
        rankLabel.text      = "\(rank)"
        titleLabel.text     = model.title
        subtitleLabel.text  = model.episode
        percentLabel.text   = model.percent
    }
}
