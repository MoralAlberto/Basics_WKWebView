import SwiftUI
import WebKit
import UIKit

struct WebView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> CustomWebView {
        CustomWebView()
    }
    
    func updateUIView(_ uiView: CustomWebView, context: UIViewRepresentableContext<WebView>) { }
}
