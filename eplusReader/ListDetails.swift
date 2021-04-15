//
//  ListDetails.swift
//  eplusReader
//
//  Created by 森谷仁美 on 2021/04/02.
//

import UIKit
import WebKit

class ListDetails: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var moveOnWebView: UIBarButtonItem!
    @IBOutlet weak var backWebView: UIBarButtonItem!
    @IBOutlet weak var reload: UIBarButtonItem!
    
    var url: String!
    var activityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //画面中央に置く
        activityIndicatorView.center = view.center
        //スタイル設定。他に、gray,whiteが選べる
        activityIndicatorView.style = UIActivityIndicatorView.Style.large
        //色設定
        activityIndicatorView.color = .gray
        //viewに追加する
        self.view.addSubview(activityIndicatorView)
        //ローディング(くるくる)をまわす
        activityIndicatorView.startAnimating()
        
        //1秒後にアニメーションを停止させる
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.activityIndicatorView.stopAnimating()
        })
        
        activityIndicatorView.hidesWhenStopped = true //ローディング止まった時、indicator消す(隠す)
        if activityIndicatorView.isAnimating { //ローディングしてるか確認
            print("ロード中")
        }
        
        if let bookurl = URL(string: url){
            let urlReq = URLRequest(url: bookurl)
            webView.load(urlReq)
        }
    }
    
    @IBAction func backWebView(_ sender: Any) {
        if (self.webView.canGoBack) {
        self.webView.goBack()
        }
    }
    
    @IBAction func moveOnWebView(_ sender: Any) {
        if (self.webView.canGoForward) {
        self.webView.goForward()
        }
    }
    
    @IBAction func refreshWebView(_ sender: Any) {
        self.webView.reload()
    }
}
