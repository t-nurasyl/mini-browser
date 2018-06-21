//
//  ThirdViewController.swift
//  AssignmentFour
//
//  Created by Toleukadyr Nurasyl on 2/21/18.
//  Copyright © 2018 Toleukadyr Nurasyl. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var fawf: UINavigationBar!
    @IBOutlet weak var WebView: UIWebView!
    var website: String?
    var name : String?
    var click : Int?
    var receiver: Receiver?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fawf.topItem?.title = name
        if let temp = website{
            let site_url = URL(string : temp)
            WebView.loadRequest(URLRequest(url: site_url!))// string--url--presentation on the screen
        }
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(fav))
        tapRecognizer.numberOfTapsRequired = 3
        self.WebView.addGestureRecognizer(tapRecognizer)
    }
    @objc func fav(recognizer: UITapGestureRecognizer) {
        
        receiver?.saveFavour(a: sites(name!,website!,true))
        if(fawf.backgroundColor != UIColor.yellow){
            fawf.backgroundColor = UIColor.yellow
        }
        else{
            fawf.backgroundColor = UIColor.white
        }
    }
}

   // override func didReceiveMemoryWarning() {
       //super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


