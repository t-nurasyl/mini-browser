//
//  SecondViewController.swift
//  AssignmentFour
//
//  Created by Toleukadyr Nurasyl on 2/21/18.
//  Copyright © 2018 Toleukadyr Nurasyl. All rights reserved.
//

import UIKit
//func append(_ newElement: Array<Any>.Element){
class SecondViewController: UIViewController, UITableViewDelegate, Receiver, UITableViewDataSource{
    var isFavour : Bool = false
    private var websites: [sites] = [
        sites.init("Google", "https://google.com", false),
        sites.init("Instagram", "https://instagram.com", false),
        sites.init("VK", "https://vk.com", false),
        sites.init("Facebook", "https://facebook.com", false)
    ]

    private var favourites: [sites] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func ChangeView(_ sender: UISegmentedControl) {
        if(!isFavour){
            isFavour = true
        }
        else{
            isFavour = false
            
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(!isFavour){
            return websites.count
        }
        else{
            return favourites.count
        }
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(!isFavour){
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = websites[indexPath.row].getName
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            if(favourites[indexPath.row].getIsFavour == true){
                cell.textLabel?.text = favourites[indexPath.row].getName
                return cell
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            websites.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    var value: sites? {
        didSet{
            if(!isFavour){
                websites.append(value!)
            }
            else{
                favourites.append(value!)
            }
            tableView.reloadData()
        }
    }
    func save(a website: sites) {
        websites.append(website)
        tableView.reloadData()
        
    }
    func saveFavour(a website: sites) {
        var iss : Bool? = false
        for web in favourites{
            if(web.getName == website.getName){//select elements inside massive Favorites
                iss = true;
            }
        }
        if(!iss!){
            favourites.append(website)
        }
        else{
            if let index = favourites.index(where: {$0.getName == website.getName}) {
                favourites.remove(at: index)
            }
        }
        tableView.reloadData()
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "mySegue"{
            if let destination = segue.destination as? ThirdViewController{
                destination.website = websites[(tableView.indexPathForSelectedRow?.row)!].getUrl
                destination.name = websites[(tableView.indexPathForSelectedRow?.row)!].getName
                destination.receiver = self
            }
        }
        else{
            let destination = segue.destination as! AddViewController
            destination.receiver = self
        }
    }
}
