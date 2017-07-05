//
//  MainViewController.swift
//  skinny
//
//  Created by Mac on 2017/7/5.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import Charts

class MainViewController: UIViewController {

    @IBOutlet weak var combinedChart: CombinedChartView!
    
    
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    let unitsSold = [2.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 17.0, 2.0, 4.0, 5.0, 4.0]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChart(xValues: months, yValuesLineChart: unitsSold, yValuesBarChart: unitsSold)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setChart(xValues: [String], yValuesLineChart: [Double], yValuesBarChart: [Double]) {
        
        combinedChart.noDataText = "Please provide data for the chart."
        
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        var yVals2 : [BarChartDataEntry] = [BarChartDataEntry]()
        
        for i in 0 ..< xValues.count{
            
            print("number is \(xValues.count)")
            yVals1.append(ChartDataEntry(x: Double(i), y: yValuesLineChart[i]))
            yVals2.append(BarChartDataEntry(x: Double(i), y: yValuesBarChart[i] - 1.0))
            
        }
        
        let lineChartSet = LineChartDataSet(values: yVals1, label: "Line Data")
        let barChartSet = BarChartDataSet(values: yVals2, label: "Bar Data")
        
        let chartData = CombinedChartData(dataSets: [lineChartSet,barChartSet])
        //let chartData = CombinedChartData(dataSets: [lineChartSet, barChartSet])
        chartData.lineData = LineChartData(dataSet: lineChartSet)
        chartData.barData = BarChartData(dataSet: barChartSet)
        
        combinedChart.data = chartData
        
    }
    
    
    

}
