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
    }
    
    //Notification発行
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureObserver()
    }
    
    func configureObserver() {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(_: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(_: )), name: UIResponder.keyboardWillHideNotification, object: nil)
        print("Notificationを発行")
    }
    
    //キーボード表示時に画面をずらす。
    @objc func keyboardWillShow(_ notification: Notification?) {
        guard let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
              let duration = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
        UIView.animate(withDuration: duration) {
            let transform = CGAffineTransform(translationX: 0, y: -(rect.size.height))
            self.view.transform = transform
        }
    }
    
    //キーボードが降りたら画面を戻す
    @objc func keyboardWillHide(_ notification: Notification?) {
        guard let duration = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? TimeInterval else { return }
        UIView.animate(withDuration: duration) {
            self.view.transform = CGAffineTransform.identity
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //メールアドレス・パスワードの入力の判定
    @IBAction func inputWord(_ sender: Any) {
        guard let mail = inputMail.text, let password = inputPassWord.text else {
            loginButton.isEnabled = false
            return
        }
        loginButton.isEnabled = mail.isEmailAdressFormat() && password.isHalfwidthAlphanumeric()
    }
    
    
    //キーボード以外をタップしたらキーボードをしまう
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // キーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func tapMoveListPage(_ sender: Any) {
        //メールアドレス・パスワードをUDに保存
        let udMail = UserDefaults.standard
        let udPassWord = UserDefaults.standard
        udMail.set(inputMail.text, forKey: "mailAdress")
        udPassWord.set(inputPassWord.text, forKey: "passWord")
        //どのStoryBoardかを指定
        let anotherStoryboard: UIStoryboard = UIStoryboard(name: "List", bundle: nil)
        //どのviewかを指定
        let anotherViewController: UIViewController = anotherStoryboard.instantiateViewController(withIdentifier: "List")
        //画面遷移が実行
        self.navigationController?.pushViewController(anotherViewController, animated: true)
        
        //アラート生成
        let alert: UIAlertController = UIAlertController(title: "SUCCESS!", message:  "ログインしました", preferredStyle:  UIAlertController.Style.alert)
        // 確定ボタンの処理
        let confirmAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            // 確定ボタンが押された時の処理をクロージャ実装する
            (action: UIAlertAction!) -> Void in
            print("ログインしました")
        })
        
        //UIAlertControllerにOKボタンをActionを追加
        alert.addAction(confirmAction)
        //実際にAlertを表示する
        present(alert, animated: true, completion: nil)
    }
}

extension String {
    /// TextFieldへ入力されたのが半角英数字かどうかを判定します。
    /// - Returns: TextFieldへ入力されたのが半角英数字以外の場合、falseを返します。
    func isHalfwidthAlphanumeric() -> Bool{
        let pattern = "^[A-Za-z0-9]+$"
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return false
        }
        let matches = regex.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
        return matches.count > 0
    }
    /// TextFieldへ入力されたのがメールアドレス形式かどうかを判定します。
    /// - Returns: TextFieldへ入力されたのがメールアドレス形式以外の場合、falseを返します。
    func isEmailAdressFormat() -> Bool{
        let pattern = "^[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}+$"
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return false
        }
        let matches = regex.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
        return matches.count > 0
    }
}
