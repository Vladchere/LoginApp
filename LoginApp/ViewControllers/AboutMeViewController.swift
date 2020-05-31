//
//  AboutMeViewController.swift
//  LoginApp
//
//  Created by Vladislav on 31.05.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var mailLabel: UILabel!
    @IBOutlet var additionalLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailLabel.text = "Меня зовут Влад. Мне 27 лет, я из города Новосибирск) Последнии полтора года работаю web-тестировщиком в компании Movavi. Мечтаю стать ios разработчиком) Увлекаюсь армрестлингом, компьютерным железом, немного космосом и антропологией) еще немного машинами)"
        
        imageView.image = UIImage(named: "main")
        
        additionalLabel.text = "В последнее время занимаюсь только учебой, а что еще дома делать)"
    }
}
