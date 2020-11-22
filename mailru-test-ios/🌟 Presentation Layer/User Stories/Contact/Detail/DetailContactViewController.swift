//
//  DetailContactViewController.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper
import GKRepresentable
import DPLibrary

protocol DetailContactViewInput: ViperViewInput {
    func reloadData(with rows: [TableCellModel])
}

protocol DetailContactViewOutput: ViperViewOutput {
    func didSelectRow(_ row: TableCellModel)
}

class DetailContactViewController: ViperViewController, DetailContactViewInput {
    
    // MARK: - Props
    fileprivate var output: DetailContactViewOutput? {
        guard let output = self._output as? DetailContactViewOutput else { return nil }
        return output
    }
    
    private let table = UITableView()
    private var rows: [TableCellModel] = []
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.setTable()
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.apply(.backgroundMain)
    }
    
    // MARK: - DetailContactViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        self.setupComponents()
        self.setupActions()
        
        guard let model = viewModel as? DetailContactViewModel else { return }
        let contact = model.contact
        
        self.navigationItem.title = contact.name
        
        let avatarView = AvatarView()
        avatarView.setup(model: AvatarViewModel(avatar: contact.image))
        avatarView.frame = CGRect(x: 0, y: 0, width: 0, height: avatarView.heightDefault)
        self.table.tableHeaderView = avatarView
    }
    
    func reloadData(with rows: [TableCellModel]) {
        self.rows = rows
        self.table.reloadData()
    }
    
}

// MARK: - Actions
extension DetailContactViewController { }

// MARK: - Module functions
extension DetailContactViewController {
    
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
        self.table.registerCellClass(PhoneTableCell.self)
    }
    
}

// MARK: - UITableViewDataSource
extension DetailContactViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = self.rows.element(at: indexPath.row) else { return }
        self.output?.didSelectRow(model)
    }
    
}

// MARK: - UITableViewDataSource
extension DetailContactViewController: UITableViewDataSource {
    
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
