//
//  ViewController.swift
//  dongju
//
//  Created by LEE Jung Hwan on 6/5/24.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
   
        let preferences = WKPreferences()
       
        preferences.javaScriptCanOpenWindowsAutomatically = true
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences = preferences
        
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        

        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])


        if let url = URL(string: "https://www.apple.com") {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
        
        webView.navigationDelegate = self
        
       
    }
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("웹뷰 로드 시작")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("웹뷰 로드 완료")
    }
  
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
          decisionHandler(.allow)
      }
}


