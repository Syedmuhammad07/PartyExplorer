//
//  PartyCell.swift
//  PartyExplorer
//
//  Created by Syed Muhammad on 04/12/2023.
//

import UIKit

class PartyCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var partyImageView: UIImageView!
    @IBOutlet weak var partyName: UILabel!
    @IBOutlet weak var numberOfPeople: UILabel!
    @IBOutlet weak var startEndDates: UILabel!
    @IBOutlet weak var ammount: UILabel!
    
    //MARK: - Properties
    var partyCellVM: Party! {
        didSet {
            partyName.text = partyCellVM.name
            numberOfPeople.text = "\(partyCellVM.attendees) people attending"
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
           
            startEndDates.text = dateFormatter.string(from: partyCellVM.startDate)
            
            if partyCellVM.endDate != nil {
                startEndDates.text?.append(" - \(dateFormatter.string(from: partyCellVM.endDate!))")
            }
            
            
            let price = String(format: "%.2f", partyCellVM.price)
            ammount.text = "$\(price)"
            
            let imageURL: URL = URL(string: "\(partyCellVM.bannerImageURL)")!
            partyImageView.load(url: imageURL)
        }
    }
    
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: - Helper Methods
    
}
