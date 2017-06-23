//
//  WeightFatViewController.swift
//  skinny
//
//  Created by Mac on 2017/6/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import Charts

class WeightFatViewController: UIViewController {


    @IBOutlet weak var myView: BarChartView!

    
    
    var monthArray = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    var temperatureArray:[Double] = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29 ,30, 31, 32]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateChartsData() {
        //生成一個存放資料的陣列，型別是BarChartDataEntry.
        var dataEntries: [BarChartDataEntry] = []
        
        //實作一個迴圈，來存入每筆顯示的資料內容
        for i in 0..<monthArray.count {
            //需設定x, y座標分別需顯示什麼東西
            let dataEntry = BarChartDataEntry(x:Double(i),  y:temperatureArray[i])
            //最後把每次生成的dataEntry存入到dataEntries當中
            dataEntries.append(dataEntry)
        }
        //透過BarChartDataSet設定我們要顯示的資料為何，以及圖表下方的label
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Temperature per month")
        //把整個dataset轉換成可以顯示的BarChartData
        let charData = BarChartData(dataSet: chartDataSet)
        //最後在指定剛剛連結的myView要顯示的資料為charData
        myView.data = charData
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
