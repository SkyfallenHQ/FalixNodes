//
//  WebEmbed.swift
//  Skyfallen Desktop
//
//  Created by Yigit Kerem Oktay on 7.12.2020.
//
import WebKit
import SwiftUI

public struct WebEmbed {
    
    private let webView: WKWebView = WKWebView()

    public func load(url: URL) {
        let url_request = URLRequest(url: url)
        webView.customUserAgent = "SkyfallenDesktonV1.0/SkyfallenEmbeddedAPIWK"
        webView.load(url_request)
    }
    
    public func back() {
        
        webView.goBack()
        
    }
    
    public func forward() {
        
        webView.goForward()
        
    }
    
    public func reload(){
        
        webView.reload()
        
    }
    
    public class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {

        var parent: WebEmbed
        init(parent: WebEmbed){
            self.parent = parent
        }
        
        public func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            if navigationAction.targetFrame == nil {
                webView.load(navigationAction.request)
            }
            return nil
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
}


#if os(macOS)
extension WebEmbed: NSViewRepresentable {

    public typealias NSViewType = WKWebView

    public func makeNSView(context: NSViewRepresentableContext<WebEmbed>) -> WKWebView {

        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        return webView
    }

    public func updateNSView(_ nsView: WKWebView, context: NSViewRepresentableContext<WebEmbed>) {

    }
}
#endif
