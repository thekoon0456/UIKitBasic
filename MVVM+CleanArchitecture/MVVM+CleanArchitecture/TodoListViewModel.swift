//
//  TodoListViewModel.swift
//  MVVM+CleanArchitecture
//
//  Created by Deokhun KIM on 10/23/23.
//

import Foundation

class TodoListViewModel {
    private let todoUseCase: TodoUseCase
    
    init(todoUseCase: TodoUseCase) {
        self.todoUseCase = todoUseCase
    }
    
    var todos: [Todo] {
        return todoUseCase.getAllTodos()
    }
    
    func addTodo(title: String) {
        todoUseCase.addTodo(title: title)
    }
}
