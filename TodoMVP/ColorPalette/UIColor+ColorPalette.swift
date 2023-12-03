//
//  UIColor+ColorPalette.swift
//  ListPostsMVP
//
//  Created by Marcelo Mogrovejo on 10/02/2023.
//

import UIKit

/**
 Color palette from: https://coolors.co/272727-fed766-009fb7-696773-eff1f3
    - #272727
    - #FED766
    - #009FB7
    - #696773
    - #EFF1F3
*/
extension UIColor {

    struct Background {
        static let defaultBackgroundColor = UIColor(named: "bkg-default-color")
        static let navbarBackgroundColor = UIColor(named: "bkg-default-navbar-color")
    }

    struct Text {
        static let highlitedColor = UIColor(named: "txt-highlited-color")
        static let defaultColor = UIColor(named: "txt-default-color")
        static let placeholderColor = UIColor(named: "txt-placeholder-color")
    }

    struct Progress {
        static let mainBackgroundColor = UIColor(named: "prg-main-bkg-color")
        static let backgroundColor = UIColor(named: "prg-bkg-color")
        static let messageColor = UIColor(named: "prg-message-color")
    }

    struct Popup {
        static let mainBackgroundColor = UIColor(named: "pp-main-bkg-color")
        static let backgroundColor = UIColor(named: "pp-bkg-color")
        static let titleColor = UIColor(named: "pp-title-color")
        static let messageColor = UIColor(named: "pp-message-color")
    }

    struct Button {
        static let backgroundColor = UIColor(named: "btn-bkg-color")
        static let foregroundColor = UIColor(named: "btn-fgd-color")
    }
}
