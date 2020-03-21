import Foundation
import UIKit
import WebKit

final class CustomWebView: UIView {
    private var webView: WKWebView!
    
    init() {
        super.init(frame: .zero)
        load()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func load() {
        let bundle = Bundle(for: CustomWebView.self)
        guard let index = bundle.url(forResource: "index", withExtension: "html") else { return }
        
        let indexTemplateUrlRequest = URLRequest(url: index)
        
        let body = "I like this post, I am learning a lot!"
        
        let script = "setBody('\(body)')"
        let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
        let userContentController = WKUserContentController()
        userContentController.addUserScript(userScript)
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        
        webView = WKWebView(frame: .zero, configuration: configuration)
        addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([webView.topAnchor.constraint(equalTo: topAnchor),
                                     webView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     webView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     webView.trailingAnchor.constraint(equalTo: trailingAnchor)
                                    ])
        
        webView.load(indexTemplateUrlRequest)
    }
}
