//
//  ListViewController.swift
//  eplusReader
//
//  Created by 森谷仁美 on 2021/04/01.
//

import UIKit

class ListViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //ナビゲーションアイテムのタイトルに画像を設定する。
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "titlelogo"))
        
        
        
        //Search BarのDeligate通知先を設定
        searchBook.delegate = self
        //入力のヒントとなる、プレースホルダーを設定
        searchBook.placeholder = "検索"
        
    }
    
    
 @IBOutlet weak var searchBook: UISearchBar!
 @IBOutlet weak var tableView: UITableView!
    //検索ボタンをクリック時
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //コードを閉じる
        view.endEditing(true)
        
        if let searchWord = searchBar.text {
        //デバックエリアに出力
        print(searchWord)
        }
    }
    
}
