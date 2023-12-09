//
//  UIViewController+Alert.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 09/12/2023.
//

import UIKit

extension UIViewController {

    func presentAlertWithTitle(_ title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
}
