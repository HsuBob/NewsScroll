//
//  ViewController.swift
//  NewsScroll
//
//  Created by xbo on 2016/11/2.
//  Copyright © 2016年 com.kemasoft.www. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{
    var titleView:UIScrollView!
    var contentView:UIScrollView!
    
    
       override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let titleArry:NSArray = ["推荐","国内","国际","体育","经济","娱乐","游戏","漫画","小说","推荐","国内","国际","体育","经济","娱乐","游戏","漫画","小说"]
        
        
//        print(titleArry)
        
        
        titleView = UIScrollView.init(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 50))
        titleView.contentSize=CGSize(width: self.view.frame.width * CGFloat(titleArry.count)/5, height: 0);
        titleView.maximumZoomScale=1.5
        titleView.minimumZoomScale=0.5
        titleView.showsVerticalScrollIndicator=false
        
        for i in 0 ..< titleArry.count
        {
            let titlebut:UIButton=UIButton()
            titlebut.frame=CGRect(x:  CGFloat(i) * self.view.frame.width/5, y: 0, width: self.view.frame.width/5, height: 50)
            titlebut.backgroundColor=UIColor.lightGray
            titlebut.setTitle(  String(describing: titleArry[i]) , for: UIControlState.normal)
            titlebut.setTitle(  String(describing: titleArry[i]) , for: UIControlState.selected)
            titlebut.setTitleColor(UIColor.red, for: UIControlState.selected)
            titlebut.tag=i
            if i==0 {
                titlebut.isSelected=true
            }
            titlebut.addTarget(self, action: #selector(buttonClicked(_:)), for: UIControlEvents.touchUpInside)
            titleView.addSubview(titlebut)
        }
        
        self.view.addSubview(titleView)
        
        contentView=UIScrollView.init(frame: CGRect(x: 0, y: 80, width: self.view.frame.width, height: 600))

        contentView.delegate=self
        contentView.showsVerticalScrollIndicator=false
        contentView.bounces=false
        contentView.isPagingEnabled=true
        contentView.contentSize=CGSize(width: self.view.frame.width * CGFloat(titleArry.count), height: 0);
        self.view.addSubview(contentView);
        
        

        for i in 0 ..< titleArry.count
        {
            let vc:TableViewController = TableViewController();
            self.addChildViewController(vc)
            vc.title = "Vc\(i)";
            
          
        }

       self.scrollViewDidEndScrollingAnimation(contentView)
        
        blockClass.passValue { (blockArry) in
            print("\(blockArry)")
        }
        
        TableViewController.passValue { (blockArry) in
            print("\(blockArry)")
        }
        
        let testVc:TestViewController = TestViewController()
        testVc.title="1";
        
        
    
       
    }

    

    func buttonClicked(_ sender:UIButton) {
        for i in 0 ..< titleView.subviews.count-1 {
            let button:UIButton = titleView.subviews[i] as! UIButton
            button.isSelected=false
        }
        sender.isSelected=true
        contentView.setContentOffset(CGPoint.init(x: CGFloat(sender.tag) * self.view.frame.size.width, y: 0), animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
         
        let  width  = scrollView.frame.size.width
        let height  = scrollView.frame.size.height
        let offsetx = scrollView.contentOffset.x

        let index   = offsetx/width
        
        
        for i in 0 ..< titleView.subviews.count-1 {
            let  button:UIButton = titleView.subviews[i] as! UIButton
            button.isSelected=false
        }
        let button:UIButton = titleView.subviews[Int(index)] as! UIButton
        button.isSelected=true
        
        var titleOffset:CGPoint = titleView.contentOffset
        
         titleOffset.x = button.center.x - width * 0.5
        
        let titleMaxOffsetX = titleView.contentSize.width - width
        
        
        
        if titleOffset.x < 0 {
            titleOffset.x = 0
        }
        if titleOffset.x > titleMaxOffsetX {
            titleOffset.x = titleMaxOffsetX
        }
        
        titleView.setContentOffset( titleOffset, animated: true)
        
        
        let willShowVc:UIViewController = self.childViewControllers[Int(index) ]
        
        // 如果当前位置的位置已经显示过了，就直接返回
        if (willShowVc.isViewLoaded)
        {return}
        
        // 添加控制器的view到contentScrollView中;
        willShowVc.view.frame=CGRect(x: offsetx, y: 0, width: width, height: height)
        scrollView.addSubview(willShowVc.view)

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView)
    }
}


