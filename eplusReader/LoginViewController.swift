//
//  LoginViewController.swift
//  eplusReader
//
//  Created by 森谷仁美 on 2021/04/07.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputMail: UITextField!
    @IBOutlet weak var inputPassWord: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //最初にボタンを無効にする
        loginButton.isEnabled = false
        //デリゲートの作成
        inputMail.delegate = self
        inputPassWord.delegate = self
        //入力された文字を非表示モードにする
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    //メールアドレス・パスワードの入力の判定
    @IBAction func inputWord(_ sender: Any) {
        if inputMail.text == "" || inputPassWord.text == "" {
               loginButton.isEnabled = false
        } else {
               loginButton.isEnabled = true
        }
    }
    
    //キーボード以外をタップしたらキーボードをしまう。
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }

    @IBAction func tapMoveListPage(_ sender: Any) {
    //どのStoryBoardかを指定
        let anotherStoryboard: UIStoryboard = UIStoryboard(name: "List", bundle: nil)
        //どのviewかを指定
        let anotherViewController: UIViewController = anotherStoryboard.instantiateViewController(withIdentifier: "List")
        //画面遷移が実行
        self.navigationController?.pushViewController(anotherViewController, animated: true)
    }
}
