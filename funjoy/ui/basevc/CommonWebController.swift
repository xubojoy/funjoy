//
//  CommonWebController.swift
//  funjoy
//
//  Created by xubojoy on 2018/1/18.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

import UIKit
import WebKit
class CommonWebController: UIViewController {
    var webView: WebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
        // 配置webView样式
        
        var config = WkwebViewConfig()
        config.isShowScrollIndicator = false
        config.isProgressHidden = false
        webView = WebView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: 300, height: 500))
        webView.delegate = self
        
        // 加载普通URL
        webView.webConfig = config
        
        webView.webloadType(self, .URLString(url: "https://www.baidu.com"))
        self.view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CommonWebController:WKWebViewDelegate{
    
    func webViewUserContentController(_ scriptMessageHandlerArray: [String], didReceive message: WKScriptMessage) {
        print(message.body)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("开始加载")
    }
}

