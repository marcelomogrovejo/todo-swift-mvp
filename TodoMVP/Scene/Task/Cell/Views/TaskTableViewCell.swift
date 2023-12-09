//
//  TaskTableViewCell.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private struct Constants {
        static let textFieldInsets = UIEdgeInsets(top: 5.0, left: 15.0, bottom: -5.0, right: -15.0)
    }
    
    private lazy var taskTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .TextField.textColor
        textField.backgroundColor = .TextField.backgroundColor
        return textField
    }()
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    // MARK: - Public properties
    
    var pickerType: DatePickerType? {
        didSet {
            setupDatePicker()
        }
    }
    
    var placeholder: String? {
        didSet {
            setupPlaceholder()
        }
    }
    
    var callback: ((String) -> Void)?
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .TextField.containerBackgrounColor
        
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
    
}

extension TaskTableViewCell {

    // MARK: - Private methods

    private func setupTextField() {
        taskTextField.addTarget(self, action: #selector(TaskTableViewCell.textFieldChanged(_:)), for: .editingChanged)
        taskTextField.autocorrectionType = .no

        contentView.addSubview(taskTextField)
        let taskTextFieldConstraints = [
            taskTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.textFieldInsets.top),
            taskTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.textFieldInsets.left),
            taskTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Constants.textFieldInsets.right),
            taskTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.textFieldInsets.bottom)
        ]
        NSLayoutConstraint.activate(taskTextFieldConstraints)
    }

    private func setupDatePicker() {
        datePicker.minimumDate = Date()
        switch pickerType {
        case .date:
            datePicker.datePickerMode = .date
            datePicker.preferredDatePickerStyle = .inline
        case .time:
            datePicker.datePickerMode = .time
            datePicker.preferredDatePickerStyle = .wheels
        default:
            break
        }
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: nil,
                                         action: #selector(donePressed)
        )
        toolBar.setItems([doneButton], animated: true)
        taskTextField.inputAccessoryView = toolBar
        
        taskTextField.inputView = datePicker
    }

    private func setupPlaceholder() {
        taskTextField.attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor:
                            UIColor.TextField.placeholderColor ?? UIColor.clear
                        ]
        )
    }
}

extension TaskTableViewCell {

    // MARK: - Targets

    @objc
    private func textFieldChanged(_ textField: UITextField) -> Void {
        callback?(textField.text ?? "")
    }

    @objc
    private func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        if pickerType == .date {
            taskTextField.text = formatter.string(from: datePicker.date)
        } else {
            let components = Calendar.current.dateComponents([.hour, .minute], 
                                                             from: datePicker.date)
            taskTextField.text = "\(components.hour ?? 00):\(components.minute ?? 00)"
        }
        callback?(taskTextField.text ?? "")
        self.endEditing(true)
    }
}
