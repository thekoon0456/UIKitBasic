//
//  UseCase.swift
//  MVVM+CleanArchitecture
//
//  Created by Deokhun KIM on 10/23/23.
//

import Foundation

protocol TodoRepository {
    func getAllTodos() -> [Todo]
    func save(todo: Todo)
}

protocol TodoUseCase {
    func getAllTodos() -> [Todo]
    func addTodo(title: String)
    func toggleCompleted(todo: Todo)
}
