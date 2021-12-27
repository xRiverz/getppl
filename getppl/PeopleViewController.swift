//
//  ViewController.swift
//  getppl
//
//  Created by admin on 27/12/2021.
//

import UIKit

class PeopleViewController: UITableViewController {
    

    var people : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let api = URL(string: "https://swapi.co/api/people/")
        let session = URLSession.shared
        
        let  task = session.dataTask(with: api!, completionHandler: {
            data, response, error in
            do{
                if let jresult = try JSONSerialization.jsonObject(with: data!, options:
                JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let result = jresult["results"] as? NSArray{
                        for person in result {
                            if let personDict = person as? NSDictionary{
                                self.people.append(personDict["name"]as! String)
                            }
                        }
                    }
                }
                self.tableView.reloadData()
            }catch {
                print("Error\(error)")
            }
        })
        task.resume()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count

    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell : UITableViewCell = UITableViewCell()
        cell.textLabel?.text = people[indexPath.row]
        return cell

}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
