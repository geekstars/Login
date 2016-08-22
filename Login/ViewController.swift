//
//  ViewController.swift
//  Login
//
//  Created by Hoàng Minh Thành on 8/19/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf_user: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    
    var accounts = ["payet":"123","kante":"456","sonic":"789"]
    
    @IBAction func action_login(sender: UIButton) {
            if let password = accounts[tf_user.text!]
            {
                if password == tf_password.text
                {
                    print("Đăng nhập thành công")
                }
                else
                {
                    print("Mật khẩu không đúng")
                }
            }
            else
            {
                print("Tài khoản không tồn tại")
            }
    }
    func CheckUser() -> Int {
        let user = tf_user.text
        var dem = 0
        for us in accounts.keys
        {
            if us == user {
                dem = dem + 1
            }
        }
        return dem
    }
    @IBAction func action_dangki(sender: UIButton) {
            let user = String(tf_user.text!)
            let pass = String(tf_password.text!)
            //var dem = 0
            if user == "" {
                print("Bạn chưa nhập Username mới")
            }
            else
            {
                if pass == ""
                {
                    print("Bạn chưa nhập mật khẩu")
                }
                else
                {
                    if CheckUser() > 0 {
                        print("Tài khoản đã tồn tại")
                    }
                    else
                    {
                        accounts["\(user)"] = "\(pass)"
                        print("Đã thêm tài khoản")
                    }
                }
            }
    }
    @IBAction func action_xoa(sender: UIButton) {
                if CheckUser() > 0
                {
                    if accounts["\(String(tf_user.text!))"] == String(tf_password.text!)
                    {
                        accounts.removeValueForKey("\(String(tf_user.text!))")
                        print("Đã xoá")
                    }
                    else
                    {
                        print("Không thể xoá (Mật khẩu sai)")
                    }
                }
                else
                {
                    print("Tài khoản không tồn tại")
                }
    }
    @IBAction func action_sua(sender: UIButton) {
            if CheckUser() > 0 {
                if tf_password.text == "" {
                    print("Bạn chưa nhập mật khẩu mới")
                }
                else
                {
                    accounts.updateValue(String(tf_password.text!), forKey: String(tf_user.text!))
                    print("Đã đổi mật khẩu")
                }
            }
            else
            {
                print("Tài khoản không tồn tại")
            }
    }
    @IBAction func action_list(sender: UIButton) {
            for user in accounts {
                print(user)
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

