//
//  TestViewController.swift
//  NewsScroll
//
//  Created by xbo on 2016/12/8.
//  Copyright © 2016年 com.kemasoft.www. All rights reserved.
//

import UIKit




/// 声明代理，及代理方法
protocol PassValueDelegate:NSObjectProtocol {
    func passValue(arry:NSArray) -> Void
}

class TestViewController: UIViewController {
    
    var delegate:PassValueDelegate?    // 设置代理
    
    func back(_ sender:UIButton) -> Void {
        
        
        let numarry:NSArray = ["1", "2","3","4"]
        
        delegate?.passValue(arry: numarry)     //  通过代理传值
        
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
        
        let but = UIButton.init(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        but.backgroundColor=UIColor.yellow
        but.setTitle("Back", for: UIControlState.normal)
        but.addTarget(self, action: #selector(back(_ :)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(but)
        
        
        self.view.backgroundColor=UIColor.init(red: CGFloat(arc4random_uniform(255)), green: CGFloat(arc4random_uniform(255)), blue: CGFloat(arc4random_uniform(255)), alpha: 1.0);
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

}
