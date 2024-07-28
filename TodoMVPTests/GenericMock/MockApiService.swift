//
//  MockApiService.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 27/07/2024.
//

import Foundation
@testable import TodoMVP
@testable import TodoRepositoryPackage
import XCTest

class MockApiService: ApiServiceProtocol {

    private(set) var isGetAllCalled = false
    private(set) var numberOfTimesIsCalledGetAll = 0
    private(set) var isDeleteCalled = false
    private(set) var numberOfTimesIsCalledDelete = 0
    private(set) var isNewCalled = false
    private(set) var numberOfTimesIsCalledNew = 0

    private var success: Bool? = false
    private var expectation: XCTestExpectation?
    private var error: RepositoryError?

    init(success: Bool = true,
         expectation: XCTestExpectation?,
         error: RepositoryError? = nil) {
        self.success = success
        self.expectation = expectation
        self.error = error
    }

    func getOne(id: String, completion: @escaping (Result<DomainTodoTask, RepositoryError>) -> Void) {
        // TODO: implement
    }
    
    func getOneAsync(id: String) async throws -> DomainTodoTask {
        // TODO: implement
        DomainTodoTask(id: "", avatar: "", username: "", title: "", date: .now, description: "")
    }
    
    func getAll(completion: @escaping (Result<[DomainTodoTask], RepositoryError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) { [weak self] in
            guard let self = self else {
                return
            }
            self.isGetAllCalled = true
            self.numberOfTimesIsCalledGetAll += 1

            if let success = self.success, success {
                completion(.success(self.getMockedTasks(cant: 3)))
            } else {
                completion(.failure(self.error ?? .notFound))
            }
            self.expectation?.fulfill()
        }
    }
    
    func getAllAsync() async throws -> [DomainTodoTask] {
        // TODO: implement
        [DomainTodoTask(id: "", avatar: "", username: "", title: "", date: .now, description: "")]
    }
    
    func new(_ item: DomainTodoTask, completion: @escaping (Result<DomainTodoTask, RepositoryError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) { [weak self] in
            guard let self = self else {
                return
            }
            self.isNewCalled = true
            self.numberOfTimesIsCalledNew += 1

            if let success = self.success, success {
                completion(.success(self.getMockedTasks(cant: 1)[0]))
            } else {
                completion(.failure(self.error ?? .notFound))
            }
            self.expectation?.fulfill()
        }
    }
    
    func newAsync(_ item: DomainTodoTask) async throws -> DomainTodoTask {
        // TODO: implement
        DomainTodoTask(id: "", avatar: "", username: "", title: "", date: .now, description: "")
    }
    
    func update(_ item: TodoRepositoryPackage.DomainTodoTask, completion: @escaping (Result<TodoRepositoryPackage.DomainTodoTask, TodoRepositoryPackage.RepositoryError>) -> Void) {
        // TODO: implement
    }
    
    func updateAsync(_ item: DomainTodoTask) async throws -> DomainTodoTask {
        // TODO: implement
        DomainTodoTask(id: "", avatar: "", username: "", title: "", date: .now, description: "")
    }
    
    func delete(_ item: DomainTodoTask, completion: @escaping (Result<Bool, RepositoryError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) { [weak self] in
            guard let self = self else {
                return
            }
            self.isDeleteCalled = true
            self.numberOfTimesIsCalledDelete += 1

            if let success = self.success, success {
                completion(.success(true))
            } else {
                completion(.failure(self.error ?? .notFound))
            }
            self.expectation?.fulfill()
        }
    }

    func deleteAsync(_ item: DomainTodoTask) async throws -> Bool {
        // TODO: implement
        true
    }
    
    func completeTask(_ item: TodoRepositoryPackage.DomainTodoTask, completion: @escaping (Result<TodoRepositoryPackage.DomainTodoTask, TodoRepositoryPackage.RepositoryError>) -> Void) {
        // TODO: implement
    }
    
    func completeTaskAsync(_ item: DomainTodoTask) async throws -> DomainTodoTask {
        // TODO: implement
        DomainTodoTask(id: "", avatar: "", username: "", title: "", date: .now, description: "")
    }

}

extension MockApiService {

    func getMockedTasks(cant: Int = 1) -> [DomainTodoTask] {
        var tasks: [DomainTodoTask] = []
        for i in 0...cant {
            let task = DomainTodoTask(id: UUID().uuidString,
                                       avatar: "",
                                       username: "task\(i)",
                                       title: "Test Task \(i)",
                                       date: .now,
                                       description: "Test Task \(i) description")
            tasks.append(task)
        }
        return tasks
    }
}
