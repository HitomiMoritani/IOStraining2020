//
//  ViewController.swift
//  eplusReader
//
//  Created by 森谷仁美 on 2021/03/29.
//

import UIKit

class ViewController: UIViewController {
    
    //textViewを宣言
    @IBOutlet weak var ruleText: UITextView!
    //画面をロードした瞬間にして欲しいことを書く
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //textViewを編集不可にする
        self.ruleText.isEditable = false;
        
        // 枠のカラー
        ruleText.layer.borderColor = UIColor.gray.cgColor
        
        // 枠の幅
        ruleText.layer.borderWidth = 1.0
    }
    @IBAction func tapAcceptButton(_ sender: Any) {
        //まずは、違うstororyboardであることをここで定義します
        let anotherStoryboard: UIStoryboard = UIStoryboard(name: "List", bundle: nil)
        //どのviewかを指定
        let anotherViewController: UIViewController = anotherStoryboard.instantiateViewController(withIdentifier: "List")
        //画面遷移が実行
        self.navigationController?.pushViewController(anotherViewController, animated: true)
        
    }
}

