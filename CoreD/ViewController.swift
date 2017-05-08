//
//  ViewController.swift
//  CoreD
//
//  Created by user128130 on 5/8/17.
//  Copyright © 2017 a.yahello. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var usernameArr:[String] = []
    var passwordArr:[String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Storing data
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        //insert data
        /*let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("Ben", forKey: "username")
            newUser.setValue("667", forKey: "password")
        
        do{
        try context.save()
            print("Saved")
        }catch{
            print("error")
        }*/
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do
        {
        let results = try context.fetch(request)
            
            if results.count > 0
        
        {
            for result in results as! [NSManagedObject]
            {
                if let username = result.value(forKey: "username") as? String
                {
                    //print(username)
                    usernameArr.append(username)
                }
                if let password = result.value(forKey: "password") as? String
                {
                    //print(password)
                    passwordArr.append(password)
                }
            }
            print (usernameArr)
            print (passwordArr)
        }
        }
    catch
    {
    print("error")
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

