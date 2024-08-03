//
//  MainViewController.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 22/09/2023.
//

import UIKit
import PSSplash

class MainViewController: UIViewController {

    // MARK: - Properties

    private struct Constants {
        static let welcomeHeight: CGFloat = 50.0
        static let buttonInsets = UIEdgeInsets(top: 0.0, left: 30.0, bottom: -30.0, right: -30.0)
        static let buttonHeight: CGFloat = 40.0
        static let buttonCorner: CGFloat = 20.0
    }
    private let animationName = "ani-todo-check"

    var presenter: MainPresenterProtocol?
    var router: MainRouterProtocol?

    // MARK: - View

    private var navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.prefersLargeTitles = false
        navBar.barTintColor = .NavBar.backgroundColor
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    var welcomeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var splashView: PSSplashView = {
        let splashView = PSSplashView()
        splashView.translatesAutoresizingMaskIntoConstraints = false
        return splashView
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
        navBar.accessibilityIdentifier = "com.mogro.todomvp.mainScreen.navigationBar"
        view.addSubview(navBar)
        let navBarConstraints = [
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            navBar.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ]
        NSLayoutConstraint.activate(navBarConstraints)
    }

    private func setupWelcome() {
        view.addSubview(welcomeView)
        let welcomeViewConstants = [
            welcomeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            welcomeView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            welcomeView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            welcomeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(welcomeViewConstants)

        setupAnimation()
    }

    private func setupAnimation() {
        splashView.animationName = animationName
        splashView.loopMode = .playOnce
        splashView.accessibilityIdentifier = "com.mogro.todomvp.mainScreen.mainAnimation"
        welcomeView.addSubview(splashView)
        
        /// SplashView constraints
        splashView.translatesAutoresizingMaskIntoConstraints = false
        let splashViewConstraints = [
            splashView.centerXAnchor.constraint(equalTo: welcomeView.centerXAnchor),
            splashView.centerYAnchor.constraint(equalTo: welcomeView.centerYAnchor),
            /// The following constraints doesn't have any effect as PSSplashView has them hardcoded :-(
            splashView.widthAnchor.constraint(equalTo: welcomeView.widthAnchor),
            splashView.heightAnchor.constraint(equalTo: splashView.widthAnchor)

        ]
        NSLayoutConstraint.activate(splashViewConstraints)
    }

    private func setupButton() {
        presenter?.getListTitleButton()

        listButton.layer.cornerRadius = Constants.buttonCorner
        listButton.backgroundColor = .Button.backgroundColor
        listButton.setTitleColor(.Button.foregroundColor, for: .normal)
        listButton.addTarget(self, action: #selector(MainViewController.showTodoList), for: .touchUpInside)
        listButton.accessibilityIdentifier = "com.mogro.todomvp.mainScreen.mainButton"

        view.addSubview(listButton)
        let listButtonConstraints = [
            listButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: Constants.buttonInsets.left),
            listButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: Constants.buttonInsets.right),
            listButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            listButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Constants.buttonInsets.bottom)
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
