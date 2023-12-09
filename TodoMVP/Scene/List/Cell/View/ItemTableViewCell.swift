//
//  ItemTableViewCell.swift
//  ListPostsMVP
//
//  Created by Marcelo Mogrovejo on 10/02/2023.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    // MARK: - Private properties

    private struct Constants {
        static let defaultAvatarWidth: CGFloat = 30.0
        static let defaultElementSpacing: CGFloat = 8.0
        static let defaultLeftMargin: CGFloat = 15.0
        static let defaultRightMargin: CGFloat = -15.0

        static let defaultTitleLinesNumber: Int = 1
        static let defaultTitleFontSize: CGFloat = 14.0

        static let defaultDateHeightMargin: CGFloat = 10
        static let defaultDateFontSize: CGFloat = 13.0

        static let defaultDescriptionLinesNumber: Int = 0
        static let defaultDescriptionBottomMargin: CGFloat = -10.0
        static let defaultDescriptionFontSize: CGFloat = 12.0
    }

    var presenter: ItemPresenterProtocol?

    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = Constants.defaultElementSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = Constants.defaultElementSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = .ListItem.defaultTask
        avatarImageView.image?.withTintColor(.systemBackground)
//        avatarImageView.layer.cornerRadius = Constants.defaultAvatarWidth / 2
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    private lazy var taskTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .Text.highlitedColor
        label.font = .systemFont(ofSize: Constants.defaultTitleFontSize)
        label.numberOfLines = Constants.defaultTitleLinesNumber
        return label
    }()
    lazy var taskDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .Text.defaultColor
        label.numberOfLines = Constants.defaultTitleLinesNumber
        label.font = .systemFont(ofSize: Constants.defaultDateFontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var taskCheckButton: ItemCheckButton = {
        let button = ItemCheckButton()
        button.isChecked = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var taskShortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .Text.defaultColor
        label.numberOfLines = Constants.defaultDescriptionLinesNumber
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Constants.defaultDescriptionFontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Public properties

    var avatarImage: UIImage? {
        didSet {
            avatarImageView.image = avatarImage
        }
    }
    var title: String? {
        didSet {
            taskTitleLabel.text = title
        }
    }
    var date: String = Date().stringyfiedDate {
        didSet {
            setupDate()
        }
    }
    var isDone: Bool = false {
        didSet {
            setupStatus(isDone)
        }
    }
    var desc: String? {
        didSet {
            taskShortDescriptionLabel.text = desc
        }
    }
    var id: Int? {
        didSet {
            setupId()
        }
    }

    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .Background.defaultBackgroundColor

        setupContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Private methods

    private func setupContent() {
        selectionStyle = .none

        /// Avatar
        horizontalStackView.addArrangedSubview(avatarImageView)
        let avatarImageViewConstraints = [
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.defaultAvatarWidth),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor)
        ]
        NSLayoutConstraint.activate(avatarImageViewConstraints)
        /// Title
        verticalStackView.addArrangedSubview(taskTitleLabel)
        /// Date
        verticalStackView.addArrangedSubview(taskDateLabel)
        let dateLabelConstraints = [
            taskDateLabel.topAnchor.constraint(equalTo: taskTitleLabel.bottomAnchor, constant: Constants.defaultElementSpacing),
            taskDateLabel.heightAnchor.constraint(equalToConstant: Constants.defaultDateHeightMargin)
        ]
        NSLayoutConstraint.activate(dateLabelConstraints)
        /// VerticalStack
        horizontalStackView.addArrangedSubview(verticalStackView)
        /// HorizontalStack
        contentView.addSubview(horizontalStackView)
        let horizontalStackViewConstraints = [
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.defaultElementSpacing),
            horizontalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.defaultLeftMargin)

        ]
        NSLayoutConstraint.activate(horizontalStackViewConstraints)
        /// Check
        horizontalStackView.addArrangedSubview(taskCheckButton)
        let checkButtonConstraints = [
            taskCheckButton.widthAnchor.constraint(equalToConstant: Constants.defaultAvatarWidth),
            taskCheckButton.heightAnchor.constraint(equalTo: taskCheckButton.widthAnchor),
            taskCheckButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Constants.defaultRightMargin)
        ]
        NSLayoutConstraint.activate(checkButtonConstraints)
        /// Description
        contentView.addSubview(taskShortDescriptionLabel)
        let descriptionLabelConstraints = [
            taskShortDescriptionLabel.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: Constants.defaultElementSpacing),
            taskShortDescriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.defaultLeftMargin),
            taskShortDescriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Constants.defaultRightMargin),
            taskShortDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.defaultDescriptionBottomMargin)

        ]
        NSLayoutConstraint.activate(descriptionLabelConstraints)
    }

    private func setupId() {
        taskCheckButton.id = id
    }

    private func setupDate() {
        presenter?.view = self
        let request = Item.Date.Request(dateStr: date)
        presenter?.verifyDate(request: request)
    }

    private func setupStatus(_ isDone: Bool = false) {
        taskCheckButton.isChecked = isDone
    }

    // MARK: Targets

//    @objc
//    private func taskDone() {
//        print("Task done!")
//    }

}

