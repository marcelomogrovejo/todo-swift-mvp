//
//  TaskTextFieldTableViewCell.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import UIKit

class TaskTextFieldTableViewCell: UITableViewCell {

    // MARK: - Private properties

    private struct Constants {
        static let textFieldInsets = UIEdgeInsets(top: 5.0, left: 15.0, bottom: -5.0, right: -15.0)
    }

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .Text.defaultColor
        textField.backgroundColor = .Background.defaultBackgroundColor
        return textField
    }()

    // MARK: - Public properties

    var placeholder: String? {
        didSet {
            setupPlaceholder()
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

        contentView.addSubview(textField)
        let textFieldConstraints = [
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.textFieldInsets.top),
            textField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.textFieldInsets.left),
            textField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Constants.textFieldInsets.right),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.textFieldInsets.bottom)
        ]
        NSLayoutConstraint.activate(textFieldConstraints)
    }

    private func setupPlaceholder() {
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.Text.placeholderColor ?? UIColor.clear]
        )
    }
}
