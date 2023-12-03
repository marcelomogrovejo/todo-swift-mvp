//
//  ItemCheckButton.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 01/12/2023.
//

import UIKit

//protocol ItemCheckDelegate: AnyObject {
//    func
//}

class ItemCheckButton: UIButton {

    private struct Constants {
        static let checkOnImage: UIImage = .ListItem.checkOn ?? UIImage(systemName: "checkmark.circle.fill")!
        static let checkOffImage: UIImage = .ListItem.checkOff ?? UIImage(systemName: "checkmark.circle")!
    }

//    weak var delegate: ItemCheckDelegate?

    init() {
        super.init(frame: .zero)

        addTarget(self, action: #selector(ItemCheckButton.triggerAction(sender:)), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var isChecked: Bool = false {
        didSet {
            toggleState(isChecked: isChecked)
        }
    }
    var id: Int?

    private func toggleState(isChecked: Bool) {
        self.isSelected = isChecked
        if isChecked {
            self.setImage(Constants.checkOnImage, for: .selected)
        } else {
            self.setImage(Constants.checkOffImage, for: .normal)
        }
    }

    @objc
    private func triggerAction(sender: UIButton) {
        toggleState(isChecked: !sender.isSelected)
//        delegate?.updateStete(isChecked: <#T##Bool#>)
    }
}
