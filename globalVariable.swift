//
//  globalVariable.swift
//  eplusReader
//
//  Created by 森谷仁美 on 2021/04/20.
//

import Foundation

var globalVariable: Int = 1
class ViewController: UIViewController {
    func viewDidLoad() {
        super.viewDidLoad()
        globalVariable += 5
    }
}
