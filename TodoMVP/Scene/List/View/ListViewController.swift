//
//  ListViewController.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 23/09/2023.
//

import UIKit

class ListViewController: UIViewController {

    // MARK: - Properties

    private struct Constants {
        static let defaultNavBarHeight: CGFloat = 48.0
    }
    struct TableViewConstants {
        static let numberOfSections: Int = 1
        static let cellId: String = "ItemCellId"
    }
    var presenter: ListPresenterProtocol?
    var router: ListRouterProtocol?

    var tasks: [Task] = []

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: TableViewConstants.cellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Private

    private func setupView() {
        view.backgroundColor = .Background.defaultBackgroundColor

        setupNavigationBar()

        presenter?.getTitle()

        setupList()
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .NavBar.backgroundColor
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(ListViewController.newTask))
        addButton.tintColor = .Button.foregroundColor
        let closeButton = UIBarButtonItem(barButtonSystemItem: .stop, 
                                          target: self,
                                          action: #selector(ListViewController.dismissSelf))
        closeButton.tintColor = .Button.foregroundColor
        navigationItem.rightBarButtonItems = [closeButton, addButton]
    }

    private func setupList() {
        tableView.backgroundColor = .Background.defaultBackgroundColor
        view.addSubview(tableView)
        let tableViewConstants = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0.0),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0.0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0)
        ]
        NSLayoutConstraint.activate(tableViewConstants)

        presenter?.fetchTaskList()
    }

    // MARK: - Target

    @objc
    private func newTask() {
        router?.navigateToTask(view: self)
    }

    @objc
    private func dismissSelf() {
        router?.dismissSelf(listViewController: self)
    }
}
