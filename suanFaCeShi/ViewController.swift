//
//  ViewController.swift
//  suanFaCeShi
//
//  Created by XF on 2018/8/27.
//  Copyright © 2018年 XF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct Stack<T> {
        fileprivate var array = [T]()
        
        public var isEmpty: Bool{
            return array.isEmpty
        }
        
        public var count: Int{
            return array.count
        }
        
        public mutating func push(_ element:T){
            array.append(element)
        }
        
        public mutating func pop() ->T?{
            return array.popLast()
        }
        
        public var top: T?{
            return array.last
        }
    }

    public class ListNode{
        public var val:Int
        public var next: ListNode?
        public init(_ val:Int){
            self.val = val
            self.next = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.twoSum([2,7,11,15], 9)
        
//        let oneNode:ListNode = ListNode.init(1)
//        let oneOneNode : ListNode = ListNode.init(2);
//        let oneOneOneNode : ListNode = ListNode.init(4)
//        oneOneNode.next = oneOneOneNode
//        oneNode.next = oneOneNode
//        // 243  564
//        let twoNode : ListNode = ListNode.init(1)
//        let twoTwoNode : ListNode = ListNode.init(3)
//        let twoTwoTwoNode : ListNode = ListNode.init(4)
//        twoTwoNode.next = twoTwoTwoNode
//        twoNode.next = twoTwoNode
//        self.mergeTwoLists(oneNode, twoNode)
        
//
//        let newNode:ListNode =  self.addTwoNumbers(oneNode, twoNode)!
//
//        let newNewNode:ListNode = newNode.next!;
//        let newNewNewNode:ListNode = newNewNode.next!
//        print("返回的值:\(newNode.val,newNewNode.val,newNewNewNode.val)")
          //print(self.lengthOfLongeststSubstring("abcabcbb"))
          //print(self.reverse(321))
          //print(self.reverse(1534236469))
          //print(self.isPalindrome(-121))
          //print(self.longestCommonPrefix(["c","c"]))
          //print(self.isValid("{[]}"))
          //print(removeElement([3,2,2,3], 3))
          //print(self.strStr("mississippi","issip"))
          //print(self.searchInsert([1,3,5,6], 5))
          //print(self.countAndSay(5))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //报数
    func countAndSay(_ n:Int)->String{
        if n == 1{
            return "1"
        }
        if n < 1 {
            return ""
        }
        if n == 2{
            return "11"
        }
        if n == 3 {
            return "21"
        }
        
        var str = "21"
        var tempresult = ""
        var sum = 1
        for _ in 3...n-1 {
            sum = 1
            for j in 0...str.count-1{
                
                let index = str.index(str.startIndex, offsetBy: j)
            
                let indexString = String(str[index])
                var index1String = ""
                var index2String = ""
                if j+1 <= str.count-1{
                   let index1 = str.index(str.startIndex, offsetBy: j+1)
                   index1String = String(str[index1])
                }
                if j-1 >= 0{
                    let index2 = str.index(str.startIndex, offsetBy: j-1)
                    index2String = String(str[index2])
                }
                
                if j != str.count-1 && indexString == index1String{
                    sum = sum+1
                    continue
                }else if j == str.count-1 && indexString == index2String{
                    tempresult = tempresult+String(sum)+indexString
                }
                else{
                     tempresult = tempresult+String(sum)+String(str[index])
                     sum = 1
                }
            }
            str = tempresult
            tempresult = ""
        }
        return str
    }
    //搜索插入位置
    func searchInsert(_ nums:[Int],_ target:Int) -> Int{
        var index = 0
        if nums.count == 0 {
            return 0
        }
        
        for i in 0...nums.count-1 {
            var valus = nums[i]
            if valus == target{
                index = i
                break
            }
            
            if valus < target{
                if i+1 == nums.count{
                    index = nums.count
                    break
                }else{
                  valus = nums[i+1]
                    if valus >  target{
                        index = i+1
                        break
                    }
                }
            }else{
                if i > 0{
                    index = i-1
                }
                break
            }
        }
        
        return index
    }
    //实现查找字符串
    func strStr(_ haystack:String,_ needle:String)->Int{
        if  needle.count > haystack.count {
            return -1
        }
        if  needle.count == 0  {
            return 0
        }
        
        var index = -1
        let l1 = haystack.count
        let l2 = needle.count
        for i in 0...(l1-l2) {
            
            var flag = 0
            for j in 0...needle.count-1{
                let indexI = haystack.index(haystack.startIndex, offsetBy: i+j)
                let indexJ = needle.index(needle.startIndex, offsetBy: j)
                if haystack[indexI] != needle[indexJ]{
                    if flag != 1{
                        index += 1
                    }else{
                        flag = 0
                    }
                    break
                }else{
                    if flag != 1{
                        index += 1
                    }
                    flag = 1
                    
                }
            }
            if flag > 0{
            return index
            }
        }
        return -1
    }
    //移除元素
//    func removeElement(_ nums:[Int],_ val:Int)->Int{
//        if  nums.count <= 0 {
//            return 0
//        }
//        var i = 0
//        for j in 0...nums.count-1 {
//            if nums[j] != val{
//                nums[i] = nums[j]
//                i += 1
//            }
//        }
//        return i
//    }
    //删除数组的重复项
    func removeDuplicates(_ nums: inout[Int]) ->Int{
        if nums.count <= 0{
            return 0
        }
        if nums.count == 1{
            return 1
        }
        
        var i = 0
        for j in 1...nums.count-1{
            if nums[j] != nums[i]{
                i += 1
                nums[i] = nums[j]
            }
        }
        return i+1
    }
    //合并两个有序链表
    func mergeTwoLists(_ l1:ListNode?,_ l2:ListNode?)->ListNode?{
        var newNode : ListNode = ListNode.init(0)
        let newNode1 : ListNode = newNode
        var a  = l1
        var b  = l2
        
        while a != nil && b != nil {
            
            let x = a!.val
            let y = b!.val
            
            if x > y {
                newNode.next = b
                newNode = newNode.next!
                if b != nil{
                    b = b?.next
                }
            }else{
                newNode.next = a
                newNode = newNode.next!
                if a != nil{
                   a = a?.next
                }
            }
        }
        
        if a == nil && b != nil {
            newNode.next = b
        }
        if b == nil && a != nil {
            newNode.next = a
        }
        
        return newNode1.next
    }
    //有效的括号
    func isValid(_ s:String)->Bool{
        //栈思想，左右括号比对
        let charArray = Array(s)
        
        let symbelArray : [Character] = ["(","{","[",")","}","]"]
        
        var stackStr = Stack<Character>()
        
        for item in charArray {
            if let index = symbelArray.index(of: item){
                if index < 3 {
                    stackStr.push(item)
                }else{
                    //如果左括号数据栈没有数据，匹配失败
                    if stackStr.isEmpty{
                        return false
                    }
                    
                    if let top = stackStr.top{
                        if symbelArray[index-3] != top{
                            return false
                        }
                        stackStr.pop()
                    }
                }
            }
        }
        return stackStr.isEmpty
    }
    //找出最大的公共前缀
    func longestCommonPrefix(_ strs:[String])-> String{
        if strs.count <= 0 {
            return ""
        }
        if strs.count == 1 {
            return strs[0]
        }
        
        if strs[0].count <= 0 {
            return ""
        }
        
        var indexCount = 0
        var flag = true
        var prefixString = ""
        
        while flag != false  {
           
            for i in 0...(strs.count-2){
                var string = strs[i]
                var twoString = strs[i+1]
                
                if indexCount == string.count || indexCount == twoString.count{
                    flag = false
                    break
                }
                
                let index = string.count <= 1 ? string.startIndex : string.index(string.startIndex, offsetBy: indexCount)
                
                let twoIndex = twoString.count <= 1 ? twoString.startIndex : twoString.index(twoString.startIndex, offsetBy: indexCount)
                
                let oneString = string[index]
                let twoNewString = twoString[twoIndex]
                
                string = String(oneString)
                twoString = String(twoNewString)
             
                if string.compare(twoString).rawValue == 0{
                    //是相同的
                    if i == strs.count-2{
                      prefixString = prefixString + string
                    }
                }else{
                    flag = false
                    break
                }
            }
            indexCount += 1
        }
        return prefixString
    }
    //罗马数字转整数
    func romanToInt(_ s:String)->Int{
        let dataDic:[String:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
        var rev = 0

        for i in 0...(s.count-1) {
            var newRes = 0
            let index = s.index(s.startIndex, offsetBy: i)
            if i < s.count-1{
               let newIndex = s.index(s.startIndex, offsetBy: i+1)
               let twoString = s[newIndex]
                newRes = dataDic[String(twoString)]!
            }
          let oneString = s[index]
            let res = dataDic[String(oneString)]
            if ( i == s.count-1 || newRes <= res! ){
                rev += res!
            }else{
                rev -= res!
            }
        }
        return rev
    }
    //判断一个整数是否为回文数(PS:回文数就是正反都一样的数)
    func isPalindrome(_ x:Int)-> Bool{
        if x < 0{
            return false
        }
        var rev:Int = 0
        var newX : Int = x
        while newX != 0 {
            let pop : Int = newX%10
            newX = newX/10
            rev = rev*10+pop
        }
        if rev == x {
            return true
        }else{
            return false
        }
    }
    //反转整数
    func reverse(_ x:Int)->Int{
        //需要在Int的最大值和最小值之前才不算溢出   .max   .min最大值和最小值
        var rev:Int = 0
        var newX : Int = x
        while newX != 0
        {
            let pop : Int = newX%10
            newX = newX/10
            rev = rev*10+pop
        }
        if rev > 2147483647 {
            return 0
        }else if rev < -2147483647{
            return 0
        }
        return rev
    }
    //无重复字符的最长字符串
    func lengthOfLongeststSubstring(_ s:String)-> Int{
        if s.count < 1 {
            return 0
        }
        let stringLength : Int = s.count
        var ans : Int = 0
        var hashMuDic : [Character : Int] = [Character : Int]()
        var i:Int = 0
        
        for j in 0...(stringLength-1) {
            let index = s.index(s.startIndex, offsetBy: j)
            if hashMuDic[s[index]] != nil{
                i = max(hashMuDic[s[index]]!, i);
            }
            ans = max(ans, j-i+1)
            hashMuDic[s[index]] = j+1
        }
        return ans
    }
    //两数相加（非空链表逆序）
    func addTwoNumbers(_ l1:ListNode?,_ l2:ListNode?)-> ListNode?{
        let dummyHead:ListNode = ListNode.init(0)
        var p = l1
        var q = l2
        var curr:ListNode = dummyHead
        var carry:Int = 0
        
        while (p != nil || q != nil) {
            let x:Int = (p != nil) ? p!.val : 0
            let y:Int = (q != nil) ? q!.val : 0
            //两个链表与进位的和
            let sum:Int = carry+x+y
            //标识 结束后是否要进位
            carry = sum/10
            //进位过后的两数相加和
            curr.next = ListNode.init(sum%10)
            
            curr = curr.next!
           
            if p != nil{
                p = p?.next
            }
            if q != nil{
                q = q?.next
            }
        }
        if carry > 0 {
            curr.next = ListNode.init(carry)
        }

        return dummyHead.next
    }
    //两数之和
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hashMuDic : [String : Int] = [String : Int]()
        var array:[Int] = []
        for i in 0...(nums.count-1) {
            let complement = target-nums[i]
            if((hashMuDic[String(complement)]) != nil){
                 array=[hashMuDic[String(complement)]!,i]
                break
            }
            hashMuDic[String(nums[i])] = i;
        }
        return array
    }

}

