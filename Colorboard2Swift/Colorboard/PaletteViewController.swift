//
//  PaletteViewController.swift
//  Colorboard
//
//  Created by LeonTse on 2017/4/5.
//  Copyright © 2017年 LeonTse. All rights reserved.
//
import Foundation
import UIKit
open class PaletteViewController : UITableViewController
{
    private var colors: NSMutableArray =
    {
        var colors = NSMutableArray.init()
        let cd = ColorDescription.init()
        colors.add(cd)
        return colors
    }()
    
    override open func viewWillAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colors.count
    }
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let color = self.colors[indexPath.row]
        cell.textLabel?.text = (color as AnyObject).name
        return cell
    }
    
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelect row: \(indexPath.row)")
    }
    
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("prepareForSegue with identifier: " + segue.identifier!)
        if segue.identifier == "newColor"
        {
            print("segue.identifier isEqualToString: NewColor")
            let color = ColorDescription.init()
            print(color.description)
            self.colors.add(color)
            
            let nc = segue.destination as! UINavigationController
            
            let mvc = nc.topViewController as! ColorViewController
            
            mvc.colorDescription = color
        }
        else if segue.identifier == "ExistingColor"
        {
            print("segue.identifier isEqualToString: ExistingColor")
            
            let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!
            
            let color = (self.colors[indexPath.row] as! ColorDescription)
            
            let colorViewController = (segue.destination as! ColorViewController)
            colorViewController.colorDescription = color
            colorViewController.existingColor = true
            
        }
        else
        {
            print("prepareForSegue do nothing")
        }
    }
}
