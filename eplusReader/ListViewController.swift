//
//  ListViewController.swift
//  eplusReader
//
//  Created by 森谷仁美 on 2021/04/01.
//

import UIKit
class ListViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
    
    //メニュー・ログイン画面への遷移
    @IBOutlet weak var menuIcon: UIBarButtonItem!
    //検索バー関連
    @IBOutlet weak var bookSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
//リストに表示する本の情報
    // section毎の画像配列
    let bookInfoArray = [
        ["bookArt": "rabit", "bookName":"ビロードのうさぎ","author": "マージェリィ・W・ビアンコ"],
        ["bookArt": "gurigura", "bookName":"ぐりとぐら","author": "なかがわ　りえこ"],
        ["bookArt": "moimoi", "bookName":"もいもい","author": "市原　淳"],
        ["bookArt": "searchStar", "bookName":"星を探しに","author": "しもかわら　ゆみ"],
        ["bookArt": "rabit", "bookName":"ビロードのうさぎ","author": "マージェリィ・W・ビアンコ"],
        ["bookArt": "rabit", "bookName":"ビロードのうさぎ","author": "マージェリィ・W・ビアンコ"]]
    //検索結果をおく配列
    var searchResult = [[String:String]]()


   override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // Do any additional setup after loading the view.
        //ナビゲーションアイテムに画像を設定する。
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
    
        let backBarButtonItem = UIBarButtonItem()
        backBarButtonItem.title = "戻る"
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
        
    //Table Viewのセルの数を指定
    func tableView(_ table: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
                        return searchResult.count
    }
    //各セルの要素を設定する
    func tableView(_ table: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルクラスのインスタンスを生成
           let cell = table.dequeueReusableCell(withIdentifier: "bookInfoCell", for: indexPath) as! BookCell
        
        cell.bookImage.image = UIImage(named: searchResult[indexPath.row]["bookArt"]!)
        cell.author.text = searchResult[indexPath.row]["author"]
        cell.bookTitle.text = searchResult[indexPath.row]["bookName"]
           return cell
    }
    // Cell の高さを１２０にする
     func tableView(_ table: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 120.0
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
                if data["bookName"]!.contains(bookSearchBar.text!) || data["author"]!.contains(bookSearchBar.text!){
                    searchResult.append(data)
                }
            }
        }
        //テーブルを再読み込みする。
        tableView.reloadData()
        //キーボードを閉じる
        view.endEditing(true)
    }
    

//画面遷移
    @IBAction func moveLoginPagr(_ sender: Any) {
        //まずは、違うstororyboardであることをここで定義します
        let anotherStoryboard: UIStoryboard = UIStoryboard(name: "LoginPage", bundle: nil)
        //どのviewかを指定
        let anotherViewController: UIViewController = anotherStoryboard.instantiateViewController(withIdentifier: "LoginPage")
        //画面遷移を実行
        self.navigationController?.pushViewController(anotherViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //まずは、違うstororyboardであることをここで定義します
        let anotherStoryboard: UIStoryboard = UIStoryboard(name: "ListDetails", bundle: nil)
        //どのviewかを指定
        let anotherViewController: UIViewController = anotherStoryboard.instantiateViewController(withIdentifier: "ListDetails")
        //画面遷移が実行
        self.navigationController?.pushViewController(anotherViewController, animated: true)
          
       }
    }

        
 
   

