//
//  LoginViewController.swift
//  eplusReader
//
//  Created by 森谷仁美 on 2021/04/07.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //キーボードを閉じる
        view.endEditing(true)
    }

    
    @IBAction func moveList(_ sender: Any) {
        let anotherStoryboard: UIStoryboard = UIStoryboard(name: "List", bundle: nil)
        //どのviewかを指定
        let anotherViewController: UIViewController = anotherStoryboard.instantiateViewController(withIdentifier: "List")
        //画面遷移が実行
        self.navigationController?.pushViewController(anotherViewController, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
