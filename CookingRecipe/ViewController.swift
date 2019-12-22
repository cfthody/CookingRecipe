//
//  ViewController.swift
//  CookingRecipe
//
//  Created by Elton Fernandes on 07/12/2019.
//  Copyright © 2019 Elton Fernandes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource,UIPickerViewDelegate{
    
    let app = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfCategoria: UITextField!
    @IBOutlet weak var tfDuracao: UITextField!
    
    
    var currentTextField = UITextField()
    
    let categorias = ["peixe", "salada", "sopa"]
    let categoriaPicker = UIPickerView()
    let timePicker = UIDatePicker()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        categoriaPicker.dataSource = self
        categoriaPicker.delegate = self
        
        tfCategoria.inputView = categoriaPicker
        
        timePicker.datePickerMode = .countDownTimer
        timePicker.minuteInterval = 5
        tfDuracao.inputView = timePicker
        tfNome.becomeFirstResponder()

    }
    @IBAction func onSaveNewRecipe(_ sender: Any) {
//        guard let name = tfNome.text else { return }
//        guard let categ = tfCategoria.text else { return }
//        guard let tempo = tfDuracao.text else { return }
//
//        if name.isEmpty {
//            tfNome.becomeFirstResponder()
//            return
//        }
//        if categ.isEmpty {
//            tfCategoria.becomeFirstResponder()
//            return
//        }
//        if tempo.isEmpty {
//            tfDuracao.becomeFirstResponder()
//            return
//        }
        
        //Pegar array de itens
        
        //pegar array de passos de preparacao
        
        //Pegar categoria ou criar categoria caso não existir ???
        
        //Criar a receita
        
        //Salva no app delegate
        //let app = UIApplication.shared.delegate as! AppDelegate
        //app.saveContext()
        
        //Regressa a vista das receitas
        navigationController?.popViewController(animated: true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return categorias.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return categorias[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tfCategoria.text = categorias[row]
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
}

