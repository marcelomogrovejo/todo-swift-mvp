//
//  MainViewController.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 22/09/2023.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties

    private struct Constants {
        static let welcomeHeight: CGFloat = 50.0
        static let buttonInsets = UIEdgeInsets(top: 0.0, left: 30.0, bottom: 30.0, right: 30.0)
        static let buttonHeight: CGFloat = 40.0
        static let buttonCorner: CGFloat = 20.0
    }
    var presenter: MainPresenterProtocol?
    var router: MainRouterProtocol?

    // MARK: - View

    private var navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.prefersLargeTitles = false
        navBar.barTintColor = .Background.navbarBackgroundColor
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var listButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Private

    private func setupView() {
        view.backgroundColor = .Background.defaultBackgroundColor

        setupNavBar()
        setupWelcome()
        setupButton()
    }

    private func setupNavBar() {

        // TODO: i18n

        let navItem = UINavigationItem(title: "Some Generic Title Here")
        navBar.setItems([navItem], animated: true)
        navBar.delegate = self
        view.addSubview(navBar)
        let navBarConstraints = [
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            navBar.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ]
        NSLayoutConstraint.activate(navBarConstraints)
    }

    private func setupWelcome() {
        presenter?.getWelcomeMessage()

        welcomeLabel.textColor = .Text.defaultColor
        view.addSubview(welcomeLabel)
        let welcomeLabelConstants = [
            welcomeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            welcomeLabel.heightAnchor.constraint(equalToConstant: Constants.welcomeHeight)
        ]
        NSLayoutConstraint.activate(welcomeLabelConstants)
    }

    private func setupButton() {
        presenter?.getListTitleButton()

        listButton.layer.cornerRadius = Constants.buttonCorner
        listButton.backgroundColor = .Button.backgroundColor
        listButton.setTitleColor(.Button.foregroundColor, for: .normal)
        listButton.addTarget(self, action: #selector(MainViewController.showTodoList), for: .touchUpInside)

        view.addSubview(listButton)
        let listButtonConstraints = [
            listButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: Constants.buttonInsets.left),
            listButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -Constants.buttonInsets.right),
            listButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            listButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.buttonInsets.bottom)
        ]
        NSLayoutConstraint.activate(listButtonConstraints)
    }

    // MARK: - Target

    @objc
    private func showTodoList() {
        router?.navigateToTodoList(view: self)
    }

}

// Making the navigation bar to get the very top of the screen.
extension MainViewController: UINavigationBarDelegate, UIBarPositioningDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
