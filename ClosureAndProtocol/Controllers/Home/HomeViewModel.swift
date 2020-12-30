//
//  HomeViewModel.swift
//  ClosureAndProtocol
//
//  Created by Hao Kim on 12/29/20.
//

import Foundation
protocol HomeViewModelDelegate {
  
}
protocol HomeViewModelDataSource {
    func getNumber1() -> Float?
    func getNumber2() -> Float?
}
class HomeViewModel {
    //MARK: -Properties
    var number1: Float?
    var number2: Float?
    var result: Float?
    var delegate: HomeViewModelDelegate?
    var dataSource: HomeViewModelDataSource?
    
    func getData(completion: APICompletion<Float>) {
        if let dataSource = dataSource {
            number1 = dataSource.getNumber1()
            number2 = dataSource.getNumber2()
            if number1 == nil || number2 == nil {
                completion(.failure(.error("Invalid number")))
            } else {
                completion(.success(0))
            }
        }
    }
    func add(completion: APICompletion<Float>){
        getData() { done in
            switch done {
            case .failure(let error):
                completion(.failure(.error(error.localizedDescription)))
            case .success(_):
                if let number1 = number1 , let number2 = number2 {
                    result = number1 + number2
                    completion(.success(result!))
                }
            }
        }
    }
    func sub(completion: APICompletion<Float>) {
        getData() { done in
            switch done {
            case .failure(let error):
                completion(.failure(.error(error.localizedDescription)))
            case .success(_):
                if let number1 = number1 , let number2 = number2 {
                    result = number1 - number2
                    completion(.success(result!))
                }
            }
        }
    }
    func mul(completion: APICompletion<Float>) {
        getData() { done in
            switch done {
            case .failure(let error):
                completion(.failure(.error(error.localizedDescription)))
            case .success(_):
                if let number1 = number1 , let number2 = number2 {
                    result = number1 * number2
                    completion(.success(result!))
                }
            }
        }
    }
    func div(completion: APICompletion<Float>) {
        getData() { done in
            switch done {
            case .failure(let error):
                completion(.failure(.error(error.localizedDescription)))
            case .success(_):
                if let number1 = number1 , let number2 = number2 {
                    result = number1 / number2
                    completion(.success(result!))
                }
            }
        }
    }
}
