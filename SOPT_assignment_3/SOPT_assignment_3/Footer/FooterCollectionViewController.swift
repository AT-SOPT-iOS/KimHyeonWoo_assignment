import UIKit
import SnapKit
import Then

final class FooterCollectionViewController: UIViewController {

    // MARK: — Data
    private let item: FooterItem = FooterModel.dummy.first!   // 배열의 첫 번째 요소

    // MARK: — UI Components
    private let bannerView = UIView().then {
        $0.backgroundColor = UIColor(white: 0.15, alpha: 1)
        $0.layer.cornerRadius = 8
    }
    private let badgeLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    private let messageLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 14)
    }
    private let arrowButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "nextbutton"), for: .normal)
        $0.tintColor = .white
    }
    private let linkLabel1 = UILabel().then {
        $0.text = "고객문의 · 이용약관 · 개인정보처리방침"
        $0.textColor = UIColor(white: 0.7, alpha: 1)
        $0.font = .systemFont(ofSize: 12)
    }
    private let linkLabel2 = UILabel().then {
        $0.text = "사업자정보 · 인재채용"
        $0.textColor = UIColor(white: 0.7, alpha: 1)
        $0.font = .systemFont(ofSize: 12)
    }

    // MARK: — Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupBanner()
        setupLinks()
        configure(item)
    }

    // MARK: — Setup

    private func setupBanner() {
        view.addSubview(bannerView)
        [badgeLabel, messageLabel, arrowButton].forEach { bannerView.addSubview($0) }

        bannerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        badgeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.centerY.equalToSuperview()
        }
        messageLabel.snp.makeConstraints {
            $0.leading.equalTo(badgeLabel.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
        }
        arrowButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(16)
        }
    }

    private func setupLinks() {
        view.addSubview(linkLabel1)
        view.addSubview(linkLabel2)

        linkLabel1.snp.makeConstraints {
            $0.top.equalTo(bannerView.snp.bottom).offset(12)
            $0.leading.equalTo(bannerView)
        }
        linkLabel2.snp.makeConstraints {
            $0.top.equalTo(linkLabel1.snp.bottom).offset(4)
            $0.leading.equalTo(linkLabel1)
            $0.bottom.equalToSuperview().inset(16)
        }
    }

    // MARK: — Configure

    private func configure(_ item: FooterItem) {
        badgeLabel.text      = item.badge
        messageLabel.text    = item.message
    }
}
