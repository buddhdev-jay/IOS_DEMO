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
    
    // MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarOne.delegate = self
        loadUrl(Constants.GoogleURL)
    }
}

// MARK: - Webview loadandsearch
extension WebviewViewController {
    
    func loadUrl(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        webViewTwo.load(urlRequest)
    }
    
    func searchTextOnGoogle(_ text: String) {
        let textComponents = text.components(separatedBy: " ")
        let searchString = textComponents.joined(separator: "+")
        loadUrl(Constants.GooogleSearchURL + searchString)
        
    }
}

// MARK: - UISearchBarDelegate
extension WebviewViewController :UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let urlString = searchBar.text?.lowercased()
        
        if let text = urlString {
            if text.starts(with: "http://") {
                loadUrl(urlString!)
            } else if (text.hasPrefix("www")) || (text.hasSuffix(".com")){
                loadUrl("http://\(urlString)")
            }else {
                searchTextOnGoogle(urlString ?? Constants.GoogleURL)
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        loadUrl(Constants.FacebookURL)
    }
}
