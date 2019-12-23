//
//  InvoiceView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 12/22/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct InvoiceView: View {
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 0) {
                
                /// Header
                HStack {
                    Text("Please review the following items")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                .padding(.leading, 15)
                .padding(.bottom, 30)
                
                Rectangle()
                    .fill(Color(red: 235 / 255, green: 235 / 255, blue: 239 / 255))
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 2, idealHeight: 2, maxHeight: 2 )
                
                ScrollView {
                    
                    VStack {
                        //                        CellView()
                        
                        ForEach (sampleTransactions) { item in
                            CellView(item: item)
                        }
                        
                    }
                    
                } // ScrollView
                .background(Color(red: 246 / 255, green: 246 / 255, blue: 250 / 255))

                
                Spacer()
                
            } // Vstack main
                .navigationBarTitle(Text("Approvals"))
                .navigationBarItems(trailing:
                    HStack {
                        Text("ryanoff")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        
                    }
            )
        } // Navigation View
        
    } // body
}

struct CellView: View {
    
    let item: Transaction
    
    var body: some View {
        
        HStack {
            
            /// Left column
            VStack (alignment: .leading ){
                
                Text("\(item.custVendName)")
                    .font(.title)
                
                HStack {
                    
                    VStack (alignment: .leading ){
                        Text("created by")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        Text("\(item.createdUserID)")
                            .font(.footnote)
                        
                    }
                    
                    Spacer()
                    
                    VStack (alignment: .leading ){
                        Text("due")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        
                        Text("\(item.whenDue)")
                            .font(.footnote)
                        
                    }
                    
                    Spacer()
                    
                } // HStack
                
            } // VStack
                .padding(.trailing, 15)
            
            /// Right column
            VStack {
                Spacer()
                Text("\(item.total)")
                    .font(.headline)
                Spacer()
            }
            
        } // HStack
            .padding(15)
            .frame(minWidth: 50, maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(8)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .padding(.top, 10)
            .padding(.bottom, 10)
            .shadow(color: Color(red: 242 / 255, green: 243 / 255, blue: 244 / 255), radius: 3, x: 1, y: 3)
        
        
    } // body
}

struct InvoiceView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceView()
    }
}

// Transaction Model
struct Transaction: Codable, Identifiable  {
    let id = UUID()
    let state : String
    let createdUserID : String
    let docNo : String
    let docParID : String
    let custVendName : String
    let whenCreated: String
    let whenDue: String
    let total : String
    let docID: String
    let status : String
    let recordNo : String
}

let sampleTransactions = [
    
    Transaction(state: "Submitted", createdUserID: "Sarah", docNo: "SEP SETTLEMENT 2019", docParID: "Invoice - G2", custVendName: "Stark Industries", whenCreated: "11/01/2019", whenDue: "11/10/2019", total: "3.74", docID: "SEP - G2 - SEP Settlement 2019", status: "active", recordNo: "72"),
    
    Transaction(state: "Submitted", createdUserID: "Shelly", docNo: "SEP SETTLEMENT 2019", docParID: "Invoice - G2", custVendName: "Ollivander's Wand Shop", whenCreated: "1/01/2019", whenDue: "11/10/2020", total: "23.00", docID: "SEP - G2 - SEP Settlement 2019", status: "active", recordNo: "72"),
    
    Transaction(state: "Submitted", createdUserID: "Sarah", docNo: "SEP SETTLEMENT 2019", docParID: "Invoice - G2", custVendName: "Sterling Cooper", whenCreated: "11/01/2019", whenDue: "11/10/2019", total: "2431.78", docID: "SEP - G2 - SEP Settlement 2019", status: "active", recordNo: "72"),
    
    Transaction(state: "Submitted", createdUserID: "Sarah", docNo: "SEP SETTLEMENT 2019", docParID: "Invoice - G2", custVendName: "Delos Inc", whenCreated: "11/01/2019", whenDue: "11/10/2019", total: "598.548", docID: "SEP - G2 - SEP Settlement 2019", status: "active", recordNo: "72"),
    
    Transaction(state: "Submitted", createdUserID: "Shelly", docNo: "SEP SETTLEMENT 2019", docParID: "Invoice - G2", custVendName: "Initech", whenCreated: "11/02/2019", whenDue: "11/12/2019", total: "1032.57", docID: "SEP - G2 - SEP Settlement 2019", status: "active", recordNo: "72"),
    
    Transaction(state: "Submitted", createdUserID: "Sarah", docNo: "SEP SETTLEMENT 2019", docParID: "Invoice - G2", custVendName: "Hooli", whenCreated: "11/01/2019", whenDue: "11/10/2019", total: "743.21", docID: "SEP - G2 - SEP Settlement 2019", status: "active", recordNo: "72"),
    
    Transaction(state: "Submitted", createdUserID: "Sarah", docNo: "SEP SETTLEMENT 2019", docParID: "Invoice - G2", custVendName: "Bonsai Kitten", whenCreated: "11/01/2019", whenDue: "11/10/2019", total: "107361.28", docID: "SEP - G2 - SEP Settlement 2019", status: "active", recordNo: "72"),
    
    Transaction(state: "Submitted", createdUserID: "Sarah", docNo: "SEP SETTLEMENT 2019", docParID: "Invoice - G2", custVendName: "InGen", whenCreated: "11/01/2019", whenDue: "11/10/2019", total: "0.17", docID: "SEP - G2 - SEP Settlement 2019", status: "active", recordNo: "72"),
    
    Transaction(state: "Submitted", createdUserID: "Sarah", docNo: "SEP SETTLEMENT 2019", docParID: "Invoice - G2", custVendName: "ACME Corporation", whenCreated: "11/01/2019", whenDue: "11/10/2019", total: "549.67", docID: "SEP - G2 - SEP Settlement 2019", status: "active", recordNo: "72")
]
