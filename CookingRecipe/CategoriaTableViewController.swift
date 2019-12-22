

//
//  CategoriaTableViewController.swift
//  CookingRecipe
//
//  Created by Elton Fernandes on 11/12/2019.
//  Copyright © 2019 Elton Fernandes. All rights reserved.
//

import UIKit
import CoreData

class CategoriaTableViewController: UITableViewController {
    
    let app = UIApplication.shared.delegate as! AppDelegate
    
    var textField : UITextField?
    var categoriaTextField : UITextField?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let context = app.persistentContainer.viewContext
        let request : NSFetchRequest<Categoria> = Categoria.fetchRequest()
        
        app.categorias = try! context.fetch(request)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    @IBAction func onNewCategoria(_ sender: Any) {
        let alert = UIAlertController(title: "Nova Categoria", message: "Adicione uma nova categoria", preferredStyle: .alert)
        alert.addTextField(configurationHandler: categoriaTextField)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: self.confirmHandler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        self.present(alert, animated: true)
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categorias.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        let categoria = categorias[row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoria", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = categoria.nome
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func categoriaTextField(textField : UITextField){
        categoriaTextField = textField
        categoriaTextField?.placeholder = "Insira o nome da categoria"
    }
    func confirmHandler(alert : UIAlertAction){
        let context = app.persistentContainer.viewContext
        let text = categoriaTextField?.text
        let categoria = Categoria(context: context)
        categoria.nome = text
        categorias.append(categoria)
        tableView.reloadData()
    }
}
