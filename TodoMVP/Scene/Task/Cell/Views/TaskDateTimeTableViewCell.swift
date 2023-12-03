//
//  TaskDateTimeTableViewCell.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import UIKit

class TaskDateTimeTableViewCell: UITableViewCell {

    // MARK: - Private properties

    private struct Constants {
        static let textFieldInsets = UIEdgeInsets(top: 5.0, left: 15.0, bottom: -5.0, right: -15.0)
    }

    private lazy var dateTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .Text.defaultColor
        textField.backgroundColor = .Background.defaultBackgroundColor
        return textField
    }()
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()

    // MARK: - Public properties

    enum DatePickerType {
        case date
        case time
        case text
    }

    var pickerType: DatePickerType = .date {
        didSet {
            setupDatePicker()
        }
    }

    var placeholder: String? {
        didSet {
            setupPlaceholder()
        }
    }

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .Background.defaultBackgroundColor

        setupTextField()
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

    private func setupTextField() {
        contentView.addSubview(dateTextField)
        let dateTextFieldConstraints = [
            dateTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.textFieldInsets.top),
            dateTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.textFieldInsets.left),
            dateTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Constants.textFieldInsets.right),
            dateTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.textFieldInsets.bottom)
        ]
        NSLayoutConstraint.activate(dateTextFieldConstraints)

        dateTextField.inputView = datePicker
    }

    private func setupDatePicker() {
        datePicker.minimumDate = Date()
        datePicker.datePickerMode = pickerType == .date ? .date : .time
        datePicker.preferredDatePickerStyle = pickerType == .date ? .inline : .wheels
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, 
                                         target: nil,
                                         action: #selector(donePressed)
        )
        toolBar.setItems([doneButton], animated: true)
        dateTextField.inputAccessoryView = toolBar
    }

    private func setupPlaceholder() {
        dateTextField.attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: 
                            UIColor.Text.placeholderColor ?? UIColor.clear
                        ]
        )
    }

    @objc
    private func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        if pickerType == .date {
            dateTextField.text = formatter.string(from: datePicker.date)
        } else {
            let components = Calendar.current.dateComponents([.hour, .minute], 
                                                             from: datePicker.date)
            dateTextField.text = "\(components.hour ?? 00):\(components.minute ?? 00)"
        }
        self.endEditing(true)
    }
}
