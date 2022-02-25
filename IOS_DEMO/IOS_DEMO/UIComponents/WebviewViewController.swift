//
//  WebviewViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 07/03/22.
//

import UIKit
import WebKit

class WebviewViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var searchBartwo: UISearchBar!
    @IBOutlet weak var webViewTwo: WKWebView!
    @IBOutlet weak var searchBarOne: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarOne.delegate = self
        searchBartwo.delegate = self
        loadUrl("https://www.google.com")
        self.title = "Web View"
    }
   
    @IBAction func goBackward(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
}
// MARK: - Webview searching
extension WebviewViewController{
    
    func loadUrl(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
    }
    func searchTextOnGoogle(_ text: String) {
        let textComponents = text.components(separatedBy: " ")
        let searchString = textComponents.joined(separator: "+")
        loadUrl("https://www.google.com/search?q=" + searchString)
        
    }
    func searchTextOnBing(_ text: String) {
        let textComponents = text.components(separatedBy: " ")
        let searchString = textComponents.joined(separator: "+")
        guard let url = URL(string: "https://www.bing.com/search?q=" + searchString) else { return }
        let urlRequest = URLRequest(url: url)
        webViewTwo.load(urlRequest)
    }
}
// MARK: - UISearchBarDelegate
extension WebviewViewController :UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        switch searchBar {
        case searchBarOne :
            let urlString = searchBar.text?.lowercased()
            if let text = urlString {
                if text.starts(with: "http://") {
                    loadUrl(urlString!)
                } else if (text.hasPrefix("www")) || (text.hasSuffix(".com")){
                    loadUrl("http://\(urlString!)")
                }else {
                    searchTextOnGoogle(urlString!)
                }
            }
        case searchBartwo :
            let urlString = searchBar.text?.lowercased()
            if let text = urlString {
                if text.starts(with: "http://") {
                    loadUrl(urlString!)
                } else if (text.hasPrefix("www")) || (text.hasSuffix(".com")){
                    loadUrl("http://\(urlString!)")
                }else {
                    searchTextOnGoogle(urlString!)
                }
            }
        default :
            let urlString = searchBar.text?.lowercased()
            if let text = urlString {
                if text.starts(with: "http://") {
                    loadUrl(urlString!)
                } else if (text.hasPrefix("www")) || (text.hasSuffix(".com")){
                    loadUrl("http://\(urlString!)")
                }else {
                    searchTextOnGoogle(urlString!)
                }
            }
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        loadUrl("https://www.facebook.com")
    }
}
