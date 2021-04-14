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
    
    //リストに表示する本の情報
    let bookInfo1 = BookInfo(bookCover: "rabit", bookTitle: "ビロードのうさぎ", author: "マージェリィ・W・ビアンコ", url: "https://books.rakuten.co.jp/rb/4314767/?l-id=search-c-item-text-01")
    let bookInfo2 = BookInfo(bookCover: "gurigura", bookTitle: "ぐりとぐら", author: "なかがわ　りえこ", url:"https://books.rakuten.co.jp/rb/119896/?l-id=search-c-item-text-19")
    let bookInfo3 = BookInfo(bookCover: "moimoi", bookTitle: "もいもい", author: "市原　淳", url: "https://books.rakuten.co.jp/rb/15702462/?l-id=search-c-item-text-01")
    let bookInfo4 = BookInfo(bookCover: "searchStar", bookTitle: "星を探しに", author: "しもかわら　ゆみ", url: "https://books.rakuten.co.jp/rb/15138729/?l-id=search-c-item-text-05")
    let bookInfo5 = BookInfo(bookCover: "rabit", bookTitle: "ビロードのうさぎ", author: "マージェリィ・W・ビアンコ", url: "https://books.rakuten.co.jp/rb/4314767/?l-id=search-c-item-text-01")
    let bookInfo6 = BookInfo(bookCover: "rabit", bookTitle: "ビロードのうさぎ", author: "マージェリィ・W・ビアンコ", url: "https://books.rakuten.co.jp/rb/4314767/?l-id=search-c-item-text-01")
    let bookInfo7 = BookInfo(bookCover: "rabit", bookTitle: "ビロードのうさぎ", author: "マージェリィ・W・ビアンコ", url: "https://books.rakuten.co.jp/rb/4314767/?l-id=search-c-item-text-01")
    let bookInfo8 = BookInfo(bookCover: "rabit", bookTitle: "ビロードのうさぎ", author: "マージェリィ・W・ビアンコ", url: "https://books.rakuten.co.jp/rb/4314767/?l-id=search-c-item-text-01")
    let bookInfo9 = BookInfo(bookCover: "rabit", bookTitle: "ビロードのうさぎ", author: "マージェリィ・W・ビアンコ", url: "https://books.rakuten.co.jp/rb/4314767/?l-id=search-c-item-text-01")
    let bookInfo10 = BookInfo(bookCover: "rabit", bookTitle: "ビロードのうさぎ", author: "マージェリィ・W・ビアンコ", url: "https://www.google.co.jp/")


    //検索結果をおく配列
    var bookInfoArray = [BookInfo]()
    var searchResult = [BookInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookInfoArray = [bookInfo1, bookInfo2, bookInfo3, bookInfo4, bookInfo5, bookInfo6, bookInfo7, bookInfo8, bookInfo9, bookInfo10]


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
        backBarButtonItem.title = "戻る"
        self.navigationItem.backBarButtonItem = backBarButtonItem
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
    
    //画面遷移
    @IBAction func moveLoginPage(_ sender: Any) {
        //まずは、どのstororyboardに移るかを定義
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
        let anotherViewController = anotherStoryboard.instantiateViewController(withIdentifier: "ListDetails") as! ListDetails
        //検索結果の値渡し
        anotherViewController.url = bookInfoArray[indexPath.row].url
            
        //画面遷移が実行
        self.navigationController?.pushViewController(anotherViewController, animated: true)
          
    }
}

        
 
   

