//
//  User.swift
//  LoginApp
//
//  Created by Vladislav on 30.05.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

struct User {
    let name: String
    let password: String
}

extension User {
    static func getUser() -> User {
        return User(name: "User", password: "password")
    }
}
