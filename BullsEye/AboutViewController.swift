//
//  AboutViewController.swift
//  BullsEye
//
//  Created by LALIT JAGTAP on 1/24/18.
//  Copyright © 2018 LALIT JAGTAP. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController, WKUIDelegate  {

    //    @IBOutlet weak var webView: WKWebView!        // create programmatically #1 and removed from IB
    var webView: WKWebView!                             // added this and loadView and commented IBOutlet
    
    @IBOutlet weak var webViewContainer: UIView!        // added to support Close button thru IB #2
                                                        // added UIView as container to hold WKWebView
                                                        // the WKWebView added programmatically
    
    //    override func loadView() {                        // removed this loadView method for #2 approach
//        let webConfiguration = WKWebViewConfiguration()
//        webView = WKWebView(frame: .zero, configuration: webConfiguration)
//        webView.uiDelegate = self
//        view = webView
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // added to support Close button thru IB #2
        let webConfiguration = WKWebViewConfiguration()
        let customFrame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: 0.0, height: self.webViewContainer.frame.size.height))
        self.webView = WKWebView (frame: customFrame , configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.webViewContainer.addSubview(webView)
        webView.topAnchor.constraint(equalTo: webViewContainer.topAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: webViewContainer.rightAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: webViewContainer.leftAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: webViewContainer.bottomAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: webViewContainer.heightAnchor).isActive = true
        webView.uiDelegate = self
        
        
        // Do any additional setup after loading the view.
        if let url = Bundle.main.url(forResource: "BullsEye",
                                     withExtension: "html") {
            if let htmlData = try? Data(contentsOf: url) {
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html",
                             characterEncodingName: "UTF-8",
                             baseURL: baseURL)
            }
        }
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

    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
