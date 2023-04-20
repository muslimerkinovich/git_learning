//
//  WebView.swift
//  udemy_17_Hacker_News
//
//  Created by Muslim on 20/04/23.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        if let urlString {
            if let url = URL(string: urlString) {
                let requst = URLRequest(url: url)
                uiView.load(requst)
            }
        }
    }
    
}
