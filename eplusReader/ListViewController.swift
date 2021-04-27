//
//ListViewController.swift
//eplusReader
//
//Created by 森谷仁美 on 2021/04/01.
//

import UIKit
class ListViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //検索バー関連
    @IBOutlet weak var bookSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    //ボタン関連
    var loginButton: UIBarButtonItem!
    var logoutButton: UIBarButtonItem!
    
    //BookDataのインスタンス
    var bookData = BookData()
    
    //検索結果をおく配列
    var bookInfoArray = [BookInfo]()
    var searchResult = [BookInfo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isJudgeState()
        
        bookInfoArray = [bookData.bookInfo1, bookData.bookInfo2, bookData.bookInfo3, bookData.bookInfo4, bookData.bookInfo5, bookData.bookInfo6, bookData.bookInfo7, bookData.bookInfo8, bookData.bookInfo9, bookData.bookInfo10]
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "titlelogo"))
        //Deligate・datasourceの通知先を設定
        bookSearchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        //入力のヒントとなる、プレースホルダーを設定
        bookSearchBar.placeholder = "検索"
        
        //何も入力されていなくてもReturnキーを押せるようにする。
        bookSearchBar.enablesReturnKeyAutomatically = false
        //検索結果配列にデータをコピーする。
        searchResult = bookInfoArray
        
        //次のページの戻るボタンの指定
        let backBarButtonItem = UIBarButtonItem()
        backBarButtonItem.title = "Back"
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    /// ログイン状態を判定するメソッド
    func isJudgeState() {
        if(UserDefaults.standard.string(forKey: "mailAdress") == nil || UserDefaults.standard.string(forKey: "passWord") == nil) {
            loginButton = UIBarButtonItem(title: "login", style: .done, target: self, action: #selector(loginButtonTapped(_:)))
            self.navigationItem.rightBarButtonItem = loginButton
            
        } else {
            logoutButton = UIBarButtonItem(title: "logout", style: .done, target: self, action: #selector(logoutButtonTapped(_:)))
            self.navigationItem.rightBarButtonItem = logoutButton
        }
    }
    
    //ログアウトボタンタップ時の処理
    @objc func logoutButtonTapped(_ sender: UIBarButtonItem) {
        //アラート生成
        let alert: UIAlertController = UIAlertController(title: "ログアウトしますか？", message:  "", preferredStyle:  UIAlertController.Style.alert)
        // 確定ボタンの処理
        let confirmAction: UIAlertAction = UIAlertAction(title: "はい", style: UIAlertAction.Style.default, handler: {
            // 確定ボタンが押された時の処理をクロージャ実装する
            (action: UIAlertAction!) -> Void in
            //udの削除
            UserDefaults.standard.removeObject(forKey: "mailAdress")
            UserDefaults.standard.removeObject(forKey: "passWord")
            print("確定")
            //ログイン判定
            self.isJudgeState()
        })
        
        // キャンセルボタンの処理
        let cancelAction: UIAlertAction = UIAlertAction(title: "いいえ", style: UIAlertAction.Style.cancel, handler:{
            // キャンセルボタンが押された時の処理をクロージャ実装する
            (action: UIAlertAction!) -> Void in
            print("キャンセル")
        })
        
        //UIAlertControllerにキャンセルボタンと確定ボタンをActionを追加
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        //実際にAlertを表示する
        present(alert, animated: true, completion: nil)
        
    }
    
    //ログイン時画面遷移
    @objc func loginButtonTapped(_ sender: Any) {
        //まずは、どのstororyboardに移るかを定義
        let anotherStoryboard: UIStoryboard = UIStoryboard(name: "LoginPage", bundle: nil)
        //どのviewかを指定
        let anotherViewController: UIViewController = anotherStoryboard.instantiateViewController(withIdentifier: "LoginPage")
        //画面遷移を実行
        self.navigationController?.pushViewController(anotherViewController, animated: true)
        //画面遷移と同時にキーボードを閉じる
        self.view.endEditing(true)
    }
    //tableViewの設定
    //Table Viewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルクラスのインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "bookInfoCell", for: indexPath) as! BookCell
        
        cell.bookCover.image = UIImage(named: searchResult[indexPath.row].bookImage!)
        cell.author.text = searchResult[indexPath.row].author!
        cell.bookTitle.text = searchResult[indexPath.row].bookTitle!
        return cell
    }
    
    //Cell の高さを１２０にする
    func tableView(_ table: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    //検索ボタンをクリック時
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //検索結果配列を空にする。
        searchResult.removeAll()
        if(bookSearchBar.text == "") {
            //検索文字列が空の場合はすべてを表示する。
            searchResult = bookInfoArray
        } else {
            //検索文字列を含むデータを検索結果配列に追加する。
            for data in bookInfoArray {
                if data.bookTitle!.contains(bookSearchBar.text!) || data.author!.contains(bookSearchBar.text!){
                    searchResult.append(data)
                }
            }
        }
        //テーブルを再読み込みする。
        tableView.reloadData()
        //キーボードを閉じる
        view.endEditing(true)
    }
    //キーボード以外をタップしたらキーボードをしまう。
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //リスト詳細画面への遷移
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //まずは、違うstororyboardであることをここで定義します
        let anotherStoryboard: UIStoryboard = UIStoryboard(name: "ListDetails", bundle: nil)
        //どのviewかを指定
        let anotherViewController = anotherStoryboard.instantiateViewController(withIdentifier: "ListDetails") as! ListDetails
        //検索結果の値渡し
        anotherViewController.url = bookInfoArray[indexPath.row].url
        //画面遷移が実行
        self.navigationController?.pushViewController(anotherViewController, animated: true)
        self.view.endEditing(true)
    }
    
}



