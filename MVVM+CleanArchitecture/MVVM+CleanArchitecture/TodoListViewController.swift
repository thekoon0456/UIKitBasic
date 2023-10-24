//
//  TodoListViewController.swift
//  MVVM+CleanArchitecture
//
//  Created by Deokhun KIM on 10/23/23.
//

import UIKit

class TodoListViewController: UIViewController {
    private var viewModel: TodoListViewModel!
    
    init(viewModel: TodoListViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todo List"
        
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        view.addSubview(tableView)
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodo))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addTodo() {
        // Show an alert or input field to add a new todo
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell") ?? UITableViewCell(style: .default, reuseIdentifier: "TodoCell")
        let todo = viewModel.todos[indexPath.row]
        cell.textLabel?.text = todo.title
        // Customize the cell appearance based on todo.isCompleted
        return cell
    }
}
