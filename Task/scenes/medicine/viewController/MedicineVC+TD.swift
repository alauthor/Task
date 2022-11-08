//
//  MedicineVC+TD.swift
//  Task
//
//  Created by AHMED-SAMIR on 06/11/2022.
//  
//

import UIKit

extension MedicineVC: UITableViewDataSource, UITableViewDelegate
{
    
    /**
     -> FUNCTIONS
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    func setupTableView()
    {
        self.refresher = UIRefreshControl()
        self.refresher.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        self.tableView.addSubview(self.refresher)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerNIB(cell: MedicineCell.self)
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        self.presenter.refresh()
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
        let cell = tableView.dequeue() as MedicineCell
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
    
    
}
