//
//  FJWebViewController.swift
//  funjoy
//
//  Created by xubojoy on 2018/1/18.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

import UIKit
import WebKit

class FJWebViewController: BaseViewController,UIWebViewDelegate,WKUIDelegate,WKNavigationDelegate,UIScrollViewDelegate {
   private var kwebView: WKWebView!
    public var htmlStr: String = String()
//    var webView: WebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        print("ahhahahahhahahhahhah-----",self.htmlStr)
        self.creatHeaderView()
        self.createWKWebView(htmlStr: self.htmlStr)
    }
    
    func creatHeaderView() -> Void {
        self.view.addSubview(self.customNavBar)
        self.customNavBar.wr_setBottomLineHidden(false)
        self.customNavBar.wr_setBackgroundAlpha(1)
        let fjWebVc : FJWebViewController = FJWebViewController()
        fjWebVc.customNavBar.onClickLeftButton = {[weak self] in
            self!.navigationController?.popViewController(animated: true)
        }
    }

    func createWKWebView(htmlStr: String) -> Void {
        let webConfiguration = WKWebViewConfiguration()
        kwebView = WKWebView(frame: CGRect.init(x: 0.0, y: CGFloat(WRNavigationBar.navBarBottom()), width: self.view.frame.width, height: (self.view.frame.height-CGFloat(WRNavigationBar.navBarBottom()))), configuration: webConfiguration)
        let url = NSURL(string: htmlStr)
        let request = NSURLRequest.init(url: url! as URL)
        kwebView.load(request as URLRequest)
        kwebView?.uiDelegate = self
        kwebView?.navigationDelegate = self
//        kwebView.scrollView.isScrollEnabled = true
        self.view.addSubview(kwebView)
        
//        // 配置webView样式
//        var config = WkwebViewConfig()
//        config.isShowScrollIndicator = false
//        config.isProgressHidden = false
        
//        webView = WebView.init(frame: CGRect.init(x: 0.0, y: CGFloat(WRNavigationBar.navBarBottom()), width: self.view.frame.size.width, height: (self.view.frame.height-CGFloat(WRNavigationBar.navBarBottom()))))
//        webView.delegate = self
//        // 加载普通URL
//        webView.webConfig = config
//        webView.webloadType(self, .URLString(url: "https://www.baidu.com"))
//
//        self.view.addSubview(webView)

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

//extension FJWebViewController:WKWebViewDelegate{
//
//    func webViewUserContentController(_ scriptMessageHandlerArray: [String], didReceive message: WKScriptMessage) {
//        print(message.body)
//    }
//
//    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//        print("开始加载")
//    }
//}

extension FJWebViewController{
    // WKWebView代理方法

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation   ====    %@", navigation)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinishNavigation   ====    %@", navigation)
//        webView.evaluateJavaScript("document.body.scrollHeight") { (result, error) in
//            let height = CGFloat((result as! NSNumber).floatValue)
//            print("---------内部---WKWebView-------》\(height)")
//            var kwebViewFrame:CGRect = webView.frame
//            kwebViewFrame.size.height = height
//            webView.frame = kwebViewFrame
//
//        }
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("didFailProvisionalNavigation   ====    %@\nerror   ====   %@", navigation, error)
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("didCommitNavigation   ====    %@", navigation)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print("decidePolicyForNavigationAction   ====    %@", navigationAction)
        decisionHandler(WKNavigationActionPolicy.allow)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        print("decidePolicyForNavigationResponse   ====    %@", navigationResponse)
        decisionHandler(WKNavigationResponsePolicy.allow);
    }

    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

        if challenge.protectionSpace.authenticationMethod ==  NSURLAuthenticationMethodServerTrust {
            if challenge.previousFailureCount == 0{
                let credential = URLCredential.init(trust: challenge.protectionSpace.serverTrust!)

                completionHandler(URLSession.AuthChallengeDisposition.useCredential, credential)
            }else{
                completionHandler(URLSession.AuthChallengeDisposition.cancelAuthenticationChallenge, nil)
            }
        }else{
            completionHandler(URLSession.AuthChallengeDisposition.cancelAuthenticationChallenge, nil)
        }
    }

}

