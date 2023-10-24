//
//  Repository.swift
//  MVVM+CleanArchitecture
//
//  Created by Deokhun KIM on 10/23/23.
//

import Foundation

class InMemoryTodoRepository: TodoRepository {
    private var todos: [Todo] = []
    
    func getAllTodos() -> [Todo] {
        return todos
    }
    
    func save(todo: Todo) {
        todos.append(todo)
    }
}

class TodoInteractor: TodoUseCase {
    private let repository: TodoRepository
    
    init(repository: TodoRepository) {
        self.repository = repository
    }
    
    func getAllTodos() -> [Todo] {
        return repository.getAllTodos()
    }
    
    func addTodo(title: String) {
        let newTodo = Todo(id: UUID().uuidString, title: title, isCompleted: false)
        repository.save(todo: newTodo)
    }
    
    func toggleCompleted(todo: Todo) {
        // Toggle the completion status
    }
}
