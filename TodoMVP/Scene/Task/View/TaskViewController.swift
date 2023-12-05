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
        static let titleCellId: String = "TitleCellId"
        static let descriptionCellId: String = "DescriptionCellId"
        static let dateCellId: String = "DateCellId"
        static let timeCellId: String = "TimeCellId"
    }
    var presenter: TaskPresenterProtocol?
    var router: TaskRouterProtocol?

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TableViewConstants.titleCellId)
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TableViewConstants.descriptionCellId)
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TableViewConstants.dateCellId)
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TableViewConstants.timeCellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    enum TableViewFieldType: Int {
        case title = 0
        case description = 1
        case date = 2
        case time = 3
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Private

    private func setupView() {
        view.backgroundColor = .Background.defaultBackgroundColor

        setupNavigationBar()
        setupForm()
        presenter?.getTitle()
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .Background.navbarBackgroundColor
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

        presenter?.fetchForm()
    }

    // MARK: - Target

    @objc
    private func dismissSelf() {
        router?.dismissSelf(taskViewController: self)
    }

    @objc
    private func addTask() {
        print("Saving...")
    }

}
