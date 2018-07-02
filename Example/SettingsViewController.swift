//
//  SettingsViewController.swift
//  Wallet
//
//  Created by Kishikawa Katsumi on 2018/02/05.
//  Copyright © 2018 Kishikawa Katsumi. All rights reserved.
//

import UIKit
import CryptoEthereumSwift
import WebKit

class SettingsViewController: UIViewController {
	
	
	

	

	@IBOutlet weak var test: UIView!
	var webView: WKWebView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor.gray
		
		webviewAdd()

    }
	
	func webviewAdd() {
		
		// 根据生成的WKUserScript对象，初始化WKWebViewConfiguration
		let config = WKWebViewConfiguration()
//		let uer = WKUserContentController()
//		uer.add(self, name: "getSign")
//		config.userContentController = uer
		webView = WKWebView(frame: test.bounds, configuration: config)
		test.addSubview(webView)
		
		let path = Bundle.main.path(forResource: "index", ofType: "html")!
		let html = try! String(contentsOfFile: path, encoding: .utf8)
		
		webView.loadHTMLString(html, baseURL: nil)
		
	}
	
	@IBAction func signMessage(_ sender: UIButton) {
		testSignMessage()
	}
	
	@IBAction func verifySign(_ sender: UIButton) {
		createHDWallet()

	}
	
	func createHDWallet() {

		let m = UserDefaults.standard.array(forKey: "mnemonics")

		if m != nil {

			getHDWallet()

			return
		}

		//加密密码后,保存HDWallet的mastPrivateKey到本地

		let password = "123456"
		let mnemonic = ["pattern", "run", "stay", "perfect", "swim", "grow", "win", "nasty", "digital", "feel", "labor", "good"]

		let seed = Mnemonic.seed(mnemonic: mnemonic)

		let wallet = HDWallet(seed: seed, network: .testnet)

		let address = try! wallet.generateBtcAddress(at: 0)

		print("createHDWallet create address:" + address)

		wallet.saveHDPrivateKey(password: password)

		UserDefaults.standard.set(mnemonic, forKey: "mnemonics")
		
	}
	
	func getHDWallet() {
//		let password = "1234561"
//		if let wallet = HDWallet(password: password) {
//			let address = try! wallet.generateBtcAddress(at: 0)
//			print("getHDWallet create address:" + address)
//		}else{
//			print("密码错误!!!")
//		}
	}
	
	func testSignMessage() {
		let password = "123456"

		if let wallet = HDWallet(password: password, network: .testnet) {

//			let privateKey = try! wallet.generateBtcPrivateKey(at: 0)
//			let address1 = privateKey.btcPublicKey().generateBtcAddress()
//			print("getHDWallet BtcAddress1:" + address1)

//			let address = try! wallet.generateBtcAddress(at: 0)
//			print("getHDWallet BtcAddress:" + address)
//
//			let str = "getPrivateKey(\"\(privateKey.raw.toHexString())\",\"123456\")"
//
//			webView.evaluateJavaScript(str) { (res, err) in
//				print(res ?? "成功")
//				print(err ?? "成功")
//			}
		}else{
			print("密码错误!!!")
		}
	}
}

//extension SettingsViewController: WKScriptMessageHandler {
//	func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
//		if message.name == "getSign" {
//			print(message.body)
//		}
//	}
//}


