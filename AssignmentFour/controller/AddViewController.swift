//
//  AddViewController.swift
//  AssignmentFour
//
//  Created by Toleukadyr Nurasyl on 2/21/18.
//  Copyright © 2018 Toleukadyr Nurasyl. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var SiteName: UITextField!
    @IBOutlet weak var SiteUrl: UITextField!
    var receiver: Receiver?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddSite(_ sender: UIButton) {
        let newSite = SiteName.text
        let newUrl = SiteUrl.text
        if(newSite! != "" && newSite! != ""){
            receiver?.save(a: sites(newSite!,newUrl!,false))
        }
        //print (SecondViewController.websites.count)
        self.navigationController?.popViewController(animated: true)//back
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
