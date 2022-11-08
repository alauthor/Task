//
//  CartVC+TD.swift
//  Task
//
//  Created by AHMED-SAMIR on 07/11/2022.
//  
//

import UIKit

extension CartVC: UITableViewDataSource, UITableViewDelegate
{
    
    /**
     -> FUNCTIONS
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    func setupTableView()
    {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerNIB(cell: CartCell.self)
    }
    
    
    /**
     -> DATASOURCE
     ===================================
     ->   ROWS COUNT .
     ->   CELL AT PATH .
     ->   SELECT CELL.
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return presenter.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeue() as CartCell
        presenter.displayCell(cell: cell, at: indexPath.row)
        return cell
    }
    
    /**
    -> DELEGATION
    ===================================
    ->   SELECT CELL.
    */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) 
    {
        presenter.didSelectRow(at: indexPath.row)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 128
//    }
    
}
