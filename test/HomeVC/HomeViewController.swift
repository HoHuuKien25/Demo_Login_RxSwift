//
//  HomeViewController.swift
//  test
//
//  Created by Hữu Kiên on 18/08/2023.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var account: UILabel!
    var HomeViewModel = HomeVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        // Do any additional setup after loading the view.
        updateView()
    }
    
    @IBAction func btnLogOutClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateView() {
        var accountt = account.text ?? ""
        HomeViewModel.display(account: &accountt)
        account.text = accountt
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
