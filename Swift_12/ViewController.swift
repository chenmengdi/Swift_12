//
//  ViewController.swift
//  Swift_12
//
//  Created by 陈孟迪 on 2018/1/19.
//  Copyright © 2018年 陈孟迪. All rights reserved.
//
/*
 
 Swift 的标准库提供了一个叫做 sorted(by:) 的方法，会根据你提供的排序闭包将已知类型的数组的值进行排序。一旦它排序完成， sorted(by:) 方法会返回与原数组类型大小完全相同的一个新数组，该数组的元素是已排序好的。原始数组不会被 sorted(by:) 方法修改
 
 //闭包的表达式语法
 {(parameters) ->(return type) in
 statements
 }
 
 闭包表达式语法能够使用常量形式参数、变量形式参数和输入输出形式参数，但不能提供默认值。可变形式参数也能使用，但需要在形式参数列表的最后面使用。元组也可被用来作为形式参数和返回类型。
 
 行内闭包表达式来说，形式参数类型和返回类型都应写在花括号内而不是花括号外面。
 闭包的函数整体部分由关键字 in 导入，这个关键字表示闭包的形式参数类型和返回类型定义已经完成，并且闭包的函数体即将开始。
 
 尾随闭包：
 如果你需要将一个很长的闭包表达式作为函数最后一个实际参数传递给函数，使用尾随闭包将增强函数的可读性。尾随闭包是一个被书写在函数形式参数的括号外面（后面）的闭包表达式：
 
 
 逃逸闭包：
 当闭包作为一个实际参数传递给一个函数的时候，我们就说这个闭包逃逸了。因为它可以在函数返回之后被调用。当你声明一个接受闭包作为形式参数的函数时，你可以在这个形式参数前写 @escaping来明确闭包时允许逃逸的。
 
 */
import UIKit

class ViewController: UIViewController {
     //闭包写法
    //1、声明
    var change:((String)->())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      method1()
      method2()
      method3()
    }
    
    func method3() {
      
        //2、调用
        change = {str in
            
            print("str:\(str)")
            
        }
        
        //3、实现
        change!("123")
        
        //11、调用
        
        change(block1: { (string) in
            print("string:\(string)")
        }) { (string) in
            print("string:\(string)")
        }
    }
    
    //22、实现
    func change(block1:((String)->())?,block2:((String)->())?) {
        
        block1!("111")
        block2!("222")
        
    }
    
    
    func method2() {
        
        //调用
        user {
            print("调用尾随闭包")
        }
        
        loadData { (result) in
            print("直接操作 \(result)")
        }
        
    }
    
    //尾随闭包
    func user(m:()->()) -> () {
        
        
    }
    //逃逸闭包
    func loadData(completion:@escaping(_ result:[String])->()){
        //耗时操作
        DispatchQueue.global().async {
            print("耗时操作")
        }
        
        let json = ["闭包","传值","Demo"]
        
        //回到主线程更新UI
        DispatchQueue.main.async {
            print("json数据 \(json)")
            completion(json)
        }
    }
    func method1() {
      
        //使用闭包表达式sorted(by:)方法按字母顺序排序
        let names = ["mmmm","ccccc","aaaaaa","ff","ttt"]
        let scortName = names.sorted()
        print("scortName:\(scortName)")
        

        let scortName1 = names.sorted(by: backward)
        print("scortName1:\(scortName1)")
        
    }
    
    func backward(s1:String,s2:String) -> Bool {
        return s1<s2
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

