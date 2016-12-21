//
//  TableViewController.swift
//  NewsScroll
//
//  Created by xbo on 2016/12/8.
//  Copyright © 2016年 com.kemasoft.www. All rights reserved.
//

import UIKit
typealias testBlock = (_ blockArry:NSArray) -> ()    // 定义 block


class TableViewController: UITableViewController,PassValueDelegate {
  
    
    // 代理 传值方法
    func passValue(arry:NSArray) -> Void
    {
        print("\(arry)")
        
    }
    func pushVc(_ sender:UIButton) -> Void {
        let vc:TestViewController = TestViewController()
        vc.delegate=self   //取出代理方法，取值
        self.present(vc, animated: true, completion: nil)
    }

    
    
    // block  传值方法
    class func passValue(_ block:testblock){
        
        let arry:NSArray = ["2","3","4"]
        
        block(arry)
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        self.view.backgroundColor=UIColor.init(red: CGFloat(arc4random_uniform(255))/255, green: CGFloat(arc4random_uniform(255))/255, blue: CGFloat(arc4random_uniform(255))/255, alpha: 1.0);
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        let but:UIButton = UIButton.init(frame: CGRect(x: 100, y: 200, width: 200, height: 100))
        but.backgroundColor=UIColor.brown
        but.addTarget(self, action: #selector(pushVc(_ :)), for: UIControlEvents.touchUpInside)
        but.setTitle(self.title, for: UIControlState.normal)
        self.tableView.addSubview(but)
        
    }

    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
   
    // MARK: - Table view data source

    
        override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)

        // Configure the cell...

        
        cell.textLabel?.text="\(self.title)  \(indexPath.row)";
        return cell
    }
   
   
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

