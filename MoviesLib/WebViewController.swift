//
//  WebViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 04/04/18.
//  Copyright © 2018 EricBrito. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let webPageURL = URL(string: url)
        let request = URLRequest(url: webPageURL!)
        webView.loadRequest(request)
        
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func runJS(_ sender: UIBarButtonItem) {
        
        webView.stringByEvaluatingJavaScript(from: "alert('Rodando Javascript na WebView')")
        
    }
    
}

extension WebViewController: UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loading.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        print(">>>>>>>>>>>>    ", request.url!.absoluteString)
        
        if request.url!.absoluteString.range(of: "ads") != nil {
            return false
        }
        
        return true
    }
}
