//
//  BaseViewController.swift
//  ClosureAndProtocol
//
//  Created by Hao Kim on 12/29/20.
//

import Foundation
import UIKit
class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupUI()
    }
    
    func setupData() {}
    func setupUI() {}
}
