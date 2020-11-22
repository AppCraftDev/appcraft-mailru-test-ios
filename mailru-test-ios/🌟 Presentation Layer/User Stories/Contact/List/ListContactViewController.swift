//
//  ListContactViewController.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper
import GKRepresentable
import DPLibrary

protocol ListContactViewInput: ViperViewInput {
    func reloadData(with rows: [TableCellModel])
    func setEmptyView(with model: EmptyTableViewModel?)
}

protocol ListContactViewOutput: ViperViewOutput {
    func didSelectRow(_ row: TableCellModel)
    func beginRefresh()
}

class ListContactViewController: ViperViewController, ListContactViewInput {

    // MARK: - Props
    fileprivate var output: ListContactViewOutput? {
        guard let output = self._output as? ListContactViewOutput else { return nil }
        return output
    }
    
    private let table = UITableView()
    private var rows: [TableCellModel] = []
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    override func beginLoading() {
        self.rows.removeAll()
        self.table.reloadData()
        self.table.refreshControl?.beginRefreshing()
    }
    
    override func finishLoading(with error: Error?) {
        super.finishLoading(with: error)
        self.table.refreshControl?.endRefreshing()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = AppLocalization.ContactList.navTitle.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.setTable()
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.apply(.backgroundMain)
    }
    
    // MARK: - ListContactViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        self.setupComponents()
        self.setupActions()
    }
    
    func reloadData(with rows: [TableCellModel]) {
        self.rows = rows
        self.table.reloadData()
    }
    
    func setEmptyView(with model: EmptyTableViewModel?) {
        self.table.hideDataSourceEmptyView()
        
        guard let model = model else { return }
        let view = EmptyTableView()
        view.setup(model: model)
        view.append(to: self.table)
        self.table.showDataSourceEmptyView()
    }
    
}

// MARK: - Actions
extension ListContactViewController {
    
    @objc
    private func beginRefresh() {
        self.output?.beginRefresh()
    }
    
}

// MARK: - Module functions
extension ListContactViewController {
    
    private func setTable() {
        self.table.removeFromSuperview()
        self.view.addSubview(self.table)
        self.table.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.table.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.table.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.table.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
        self.table.delegate = self
        self.table.dataSource = self
        self.table.registerCellClass(ContactListTableCell.self)
        
        self.table.refreshControl = UIRefreshControl()
        self.table.refreshControl?.addTarget(self, action: #selector(self.beginRefresh), for: .valueChanged)
    }
    
}

// MARK: - UITableViewDelegate
extension ListContactViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = self.rows.element(at: indexPath.row) else { return }
        self.output?.didSelectRow(model)
    }
    
}

// MARK: - UITableViewDataSource
extension ListContactViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let model = self.rows.element(at: indexPath.row),
            let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier, for: indexPath) as? TableCell
        else { return UITableViewCell() }
        cell.setupView()
        cell.model = model
        return cell
    }
    
}
