//
//  ViewController.swift
//  eplusReader
//
//  Created by 森谷仁美 on 2021/03/29.
//

import UIKit

class ViewController: UIViewController {
//画面をロードした瞬間にして欲しいことを書く（＋＠画面終了時にしたい処理も他にあるよ）
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tap(_ sender: Any) {
        //まずは、違うstororyboardであることをここで定義します（フロア指定。１階）
        let anotherStoryboard:UIStoryboard = UIStoryboard(name: "List", bundle: nil)
        //どのviewかを指定（部屋番号を指定。101号室的な）
        let anotherViewController: UIViewController = anotherStoryboard.instantiateViewController(withIdentifier:"List")
        //画面遷移が実行
        self.present(anotherViewController, animated: true, completion: nil)
        
    }
}

