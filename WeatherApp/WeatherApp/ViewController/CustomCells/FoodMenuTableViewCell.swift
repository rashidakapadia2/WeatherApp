import UIKit

class FoodMenuTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet var foodImageHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var subContainerView:UIView!
    @IBOutlet weak var foodImageView:UIImageView!
    @IBOutlet var vegLabel: UILabel!
    @IBOutlet var foodNameLabel: UILabel!
    @IBOutlet var foodDescriptionLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var qtyLabel: UILabel!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setUpData()
    }
    
    
    func setUpData() {
        addButton.addTarget(self, action: #selector(tapsOnAdd(sender:)), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(tapsOnPlus(sender:)), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(tapsOnMinus(sender:)), for: .touchUpInside)
    }
    
    @objc func tapsOnPlus(sender:UIButton) {

    }
    
    @objc func tapsOnMinus(sender:UIButton) {

    }
    
    func setUpData(index:Int) {
        
    }
    
    @objc func showAddbutton(_ sender:UIButton){
        
    }
    
    @objc func tapsOnAdd(sender:UIButton) {

    }
}


