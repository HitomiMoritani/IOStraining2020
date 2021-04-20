//
//  ListDetails.swift
//  eplusReader
//
//  Created by 森谷仁美 on 2021/04/02.
//

import UIKit
import WebKit

class ListDetails: UIViewController, WKUIDelegate, WKNavigationDelegate, UIWebViewDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var forwordButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var reload: UIBarButtonItem!
    
    var url: String!
    var activityIndicatorView = UIActivityIndicatorView()
    var observations = [NSKeyValueObservation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //インジゲーターのスタイル設定
        activityIndicatorView.center = view.center
        activityIndicatorView.style = UIActivityIndicatorView.Style.large
        activityIndicatorView.color = .gray
        //viewに追加する
        self.view.addSubview(activityIndicatorView)
        //ローディング(くるくる)をまわす
        activityIndicatorView.startAnimating()

        webView.navigationDelegate = self
        
        activityIndicatorView.hidesWhenStopped = true
        if activityIndicatorView.isAnimating {
            print("ロード中")
        }
        
        if let bookurl = URL(string: url){
            let urlReq = URLRequest(url: bookurl)
            webView.load(urlReq)
        }
        
        // 前のページに戻れるかどうか判断
       self.backButton.isEnabled = self.webView!.canGoBack
        observations.append(webView.observe(\.canGoBack, options: .new){ _, change in
            if let value = change.newValue {
                DispatchQueue.main.async {
                    self.backButton.isEnabled = value
                }
            }
        })
        // 次のページに進めるかどうか判断
        self.forwordButton.isEnabled = self.webView!.canGoForward
        observations.append(webView.observe(\.canGoForward, options: .new){ _, change in
            if let value = change.newValue {
                DispatchQueue.main.async {
                self.forwordButton.isEnabled = value
                }
            }
        })
    }
    
    //インジゲーターの停止
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicatorView.stopAnimating()
    }
    
    //戻るボタンの実装
    @IBAction func backButton(_ sender: Any) {
        if (self.webView.canGoBack) {
        self.webView.goBack()
        }
    }
    
    //進むボタンの実装
    @IBAction func forwordButton(_ sender: Any) {
        if (self.webView.canGoForward) {
        self.webView.goForward()
        }
    }
    
    //ページ更新ボタンの実装
    @IBAction func refreshWebView(_ sender: Any) {
        self.webView.reload()
    }
}
