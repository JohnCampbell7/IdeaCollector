//
//  ViewController.swift
//  IdeaCollector
//
//  Created by John Campbell on 07/09/2017.
//  Copyright © 2017 John Campbell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var ideas : [Idea] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
       ideas = try context.fetch(Idea.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ideas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let idea = ideas[indexPath.row]
        cell.textLabel?.text = idea.title
        cell.imageView?.image = UIImage(data: idea.image as! Data)
        return cell
        
    }
}

