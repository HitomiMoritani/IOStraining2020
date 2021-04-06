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
    @IBOutlet weak var login: UIBarButtonItem!
    
    
    @IBOutlet weak var searchBook: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
        //リストに表示する本の情報
    
    // section毎の画像配列
    let bookArtArray = [
        UIImage(named:"rabit")!,
        UIImage(named:"gurigura")!,
        UIImage(named:"moimoi")!,
        UIImage(named:"searchStar")!,
        UIImage(named:"moimoi")!,
        UIImage(named:"moimoi")!,
        UIImage(named:"moimoi")!,
        UIImage(named:"moimoi")!,
        UIImage(named:"moimoi")!,
        UIImage(named:"moimoi")!,]
    
    
    let bookNameArray = [
            "ビロードのうさぎ",
            "ぐりとぐら",
            "もいもい",
            "森を探しに",
            "8/23/17:21",
            "8/23/17:33",
            "8/23/17:33",
            "8/23/17:33",
            "8/23/17:33",
            "8/23/17:41"]
    
    let aythorArray = [
            "マージェリィ・W・ビアンコ",
            "なかがわ　りえこ",
            "市原　淳",
            "しもかわら　ゆみ",
            "8/23/17:33",
            "8/23/17:33",
            "8/23/17:33",
            "8/23/17:33",
            "8/23/17:41"]
     
   override func viewDidLoad() {
        super.viewDidLoad()
    
        //tableView.dataSource = self
        //tableView.delegate = self
        // Do any additional setup after loading the view.
        //ナビゲーションアイテムに画像を設定する。☆
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "titlelogo"))
        //Search BarのDeligate通知先を設定
        searchBook.delegate = self
        //入力のヒントとなる、プレースホルダーを設定
        searchBook.placeholder = "検索"
    }
    
    
    //Table Viewのセルの数を指定
    func tableView(_ table: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return bookArtArray.count
    }
    //各セルの要素を設定する
    func tableView(_ table: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルクラスのインスタンスを生成
           let cell = table.dequeueReusableCell(withIdentifier: "bookInfoCell",
                                                for: indexPath) as! BookCell
        
        cell.author.text = "test"
        cell.bookImage.image = UIImage(named:"rabit")!
        cell.bookTitle.text = "test"
        
           // Tag番号 1 で UIImageView インスタンスの生成
            //cell.imageView?.image = bookArtArray[indexPath.row]
    
           return cell
    
    }
     
     // Cell の高さを１２０にする
      func tableView(_ table: UITableView,
                     heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 120.0
      }
     
    
    
    //検索ボタンをクリック時
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //キーボードを閉じる
        view.endEditing(true)
        if let searchWord = searchBar.text {
        //デバックエリアに出力
        print(searchWord)
        }
    }
    
}
