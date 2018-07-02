//
//  CreateWalletViewController.swift
//  Wallet
//
//  Created by Kishikawa Katsumi on 2018/02/05.
//  Copyright © 2018 Kishikawa Katsumi. All rights reserved.
//

import UIKit
import CryptoEthereumSwift

class CreateWalletViewController: UIViewController {
    var mnemonic: [String]!
    @IBOutlet var mnemonicLabels: [UILabel]!

    override func viewDidLoad() {
		
		
    }

    @IBAction func createNewWallet(_ sender: UIButton) {
		
		
    }

    @IBAction func dismiss(_ sender: UIBarButtonItem) {
        dismiss()
    }

    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
