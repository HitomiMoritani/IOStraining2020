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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://www.amazon.co.jp/ほしをさがしに-講談社の創作絵本-しもかわら-ゆみ/dp/4061333402/ref=sr_1_13?__mk_ja_JP=カタカナ&dchild=1&keywords=うさぎ+絵本&qid=1617676508&s=books&sr=1-13") {  // URL文字列の表記間違いなどで、URL()がnilになる場合があるため、nilにならない場合のみ以下のload()が実行されるようにしている
            self.webView.load(URLRequest(url: url))
          }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
