//
//  HomeViewController.swift
//  ClosureAndProtocol
//
//  Created by Hao Kim on 12/29/20.
//

import UIKit

class HomeViewController: BaseViewController {
    //MARK: -Properties
    @IBOutlet weak var number1TextField: UITextField!
    @IBOutlet weak var number2TextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    let viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK: -Config
    override func setupData() {
        
    }
    override func setupUI() {
        
        title = "Protocol & Closure"
        
        viewModel.delegate = self
        viewModel.dataSource = self
    }
    
    //MARK: -Action
    @IBAction func addButtonTouchUpInside(_ sendoer: Any) {
        viewModel.add(){ done in
            switch done {
            case .failure(let error):
                resultLabel.text = error.localizedDescription
            case .success(let result):
                resultLabel.text = String(result)
            }
        }
    }
    @IBAction func subButtonTouchUpInside(_ sendoer: Any) {
        viewModel.sub(){ done in
            switch done {
            case .failure(let error):
                resultLabel.text = error.localizedDescription
            case .success(let result):
                resultLabel.text = String(result)
            }
        }
    }
    @IBAction func mulButtonTouchUpInside(_ sendoer: Any) {
        viewModel.mul(){ done in
            switch done {
            case .failure(let error):
                resultLabel.text = error.localizedDescription
            case .success(let result):
                resultLabel.text = String(result)
            }
        }
    }
    @IBAction func divButtonTouchUpInside(_ sendoer: Any) {
        viewModel.div(){ done in
            switch done {
            case .failure(let error):
                resultLabel.text = error.localizedDescription
            case .success(let result):
                resultLabel.text = String(result)
            }
        }
    }
}

extension HomeViewController: HomeViewModelDelegate {
    
}

extension HomeViewController: HomeViewModelDataSource {
    func getNumber1() -> Float? {
        if let number1 = number1TextField {
            return Float(number1.text!)
        } else {
            return nil
        }
    }
    
    func getNumber2() -> Float? {
        if let number2 = number2TextField {
            return Float(number2.text!)
        } else {
            return nil
        }
    }
}
