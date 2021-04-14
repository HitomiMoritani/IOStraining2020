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
    var url: String!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let bookurl = URL(string: url){
            let urlReq = URLRequest(url: bookurl)
            webView.load(urlReq)
        }
    }
}
