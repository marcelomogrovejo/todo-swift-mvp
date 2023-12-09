//
//  TaskViewController.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import UIKit

class TaskViewController: UIViewController {

    // MARK: - Properties

    struct TableViewConstants {
        static let numberOfSections: Int = 1
        static let tableCellId: String = "TableCellId"

        static let headerCellHeight: CGFloat = 20.0
        static let cellHeight: CGFloat = 50.0
    }
    var presenter: TaskPresenterProtocol?
    var router: TaskRouterProtocol?

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TableViewConstants.tableCellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    var dataSource: [String] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private

    private func setupView() {
        setupNavigationBar()
        setupForm()
        presenter?.getTitle()
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .NavBar.backgroundColor
        let cancelButton = UIBarButtonItem(title: "Cancel", 
                                           style: .plain,
                                           target: self,
                                           action: #selector(TaskViewController.dismissSelf))
        navigationItem.leftBarButtonItem = cancelButton
        cancelButton.tintColor = .Button.foregroundColor
        let addButton = UIBarButtonItem(title: "Add", 
                                        style: .plain,
                                        target: self,
                                        action: #selector(TaskViewController.addTask))
        addButton.tintColor = .Button.foregroundColor
        navigationItem.rightBarButtonItem = addButton
    }

    private func setupForm() {
        tableView.backgroundColor = .Background.defaultBackgroundColor
        view.addSubview(tableView)
        let tableViewConstants = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstants)
//        tableView.tableFooterView = UIView()

        tableView.keyboardDismissMode = .onDrag
        presenter?.initForm()
    }

    // MARK: - Target

    @objc
    private func dismissSelf() {
        router?.dismissSelf(taskViewController: self)
    }

    @objc
    private func addTask() {
        let request = TaskItem.Save.Request(dataSource: dataSource)
        presenter?.addTask(request: request)
    }

}
