//
//  HomeViewModel.swift
//  test
//
//  Created by Hữu Kiên on 18/08/2023.
//

import Foundation

class HomeVM {
    func display( account: inout String) {
        account = "Xin chào: \(UserDefaults.standard.string(forKey: "username") ?? "")"
    }
}
