//
//  ContentView.swift
//  Calculadora-IMC
//
//  Created by Nacho on 28/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var sizeClass
    @State var altura: Float = 1.50
    @State var peso: Float = 50
    @State var isEditing: Bool = false
    
    var body: some View {
        
        if sizeClass == .regular {
    
            VStack() {
                            
                Image("scale")
                    
                    .resizable()
                    .scaledToFit()
                    .frame(width: 125, height: 125)
                    .padding(.init(top: 30, leading: 30, bottom: 30, trailing: 30))
                
                Spacer()
                
                Text("\(altura, specifier: "%.2f") m")
                    
                    .foregroundColor(isEditing ? .blue : .black)
                    .font(.custom("Courier", fixedSize: 25))
                    .padding(.init(top: 30,leading: 5, bottom: 5, trailing: 5))

                Slider (value: $altura,
                        in: 0...2.30,
                    step: 0.01,
                    onEditingChanged:{(editing) in isEditing = editing},
                    minimumValueLabel: Text("min"),
                    maximumValueLabel: Text("max")) {
                        Text("") }
                            
                    .padding(.init(top: 5, leading: 20, bottom: 20, trailing: 20))
                
                Text("\(peso, specifier: "%.1f") kg")
                    
                    .foregroundColor(isEditing ? .blue : .black)
                    .font(.custom("Courier", fixedSize: 25))
                    .padding(.init(top: 30,leading: 5, bottom: 5, trailing: 5))
                
                Slider (value: $peso,
                    in: 0...150,
                    step: 0.1,
                    onEditingChanged:{(editing) in isEditing = editing},
                    minimumValueLabel: Text("min"),
                    maximumValueLabel: Text("max")) {
                        Text("") }
                    
                    .padding(.init(top: 5, leading: 20, bottom: 20, trailing: 20))
                
                Spacer()
                
                Text("\(peso/(altura * altura), specifier: "%.1f")")
                    
                    .font(.custom("Courier", fixedSize: 55))
                    .padding(.init(top: 30, leading: 30, bottom: 5, trailing: 30))
                
                if (peso/(altura * altura)) >= 30 {
                
                    Text("obesidad")
                        
                        .font(.custom("Courier", fixedSize: 25))
                        .padding(.init(top: 5, leading: 30, bottom: 30, trailing: 30))
                        .foregroundColor(.red)
                    
                } else if (peso/(altura * altura)) <= 18.5 {
                
                    Text("insuficiente")
                    
                        .font(.custom("Courier", fixedSize: 25))
                        .padding(.init(top: 5, leading: 30, bottom: 30, trailing: 30))
                        .foregroundColor(.blue)
                    
                } else if (peso/(altura * altura)) > 18.5 &&  (peso/(altura * altura)) < 25 {
                    
                    Text("normal")
                        
                        .font(.custom("Courier", fixedSize: 25))
                        .padding(.init(top: 5, leading: 30, bottom: 30, trailing: 30))
                        .foregroundColor(.black)
                    
                } else {
                    
                    Text("sobrepeso")
                        
                        .font(.custom("Courier", fixedSize: 25))
                        .padding(.init(top: 5, leading: 30, bottom: 30, trailing: 30))
                        .foregroundColor(.orange)
                }
            }
    
        } else {
            
            HStack() {
                            
                Image("scale")
                    
                    .resizable()
                    .scaledToFit()
                    .frame(width: 125, height: 125)
                    .padding(.init(top: 30, leading: 30, bottom: 30, trailing: 30))
                
                Spacer()
                
                VStack() {
                
                    Text("\(altura, specifier: "%.2f") m")
                        
                        .foregroundColor(isEditing ? .blue : .black)
                        .font(.custom("Courier", fixedSize: 25))
                        .padding(.init(top: 30,leading: 5, bottom: 5, trailing: 5))

                    Slider (value: $altura,
                            in: 0...2.30,
                        step: 0.01,
                        onEditingChanged:{(editing) in isEditing = editing},
                        minimumValueLabel: Text("min"),
                        maximumValueLabel: Text("max")) {
                            Text("") }
                                
                        .padding(.init(top: 5, leading: 20, bottom: 20, trailing: 20))
                    
                    Text("\(peso, specifier: "%.1f") kg")
                        
                        .foregroundColor(isEditing ? .blue : .black)
                        .font(.custom("Courier", fixedSize: 25))
                        .padding(.init(top: 30,leading: 5, bottom: 5, trailing: 5))
                    
                    Slider (value: $peso,
                        in: 0...150,
                        step: 0.1,
                        onEditingChanged:{(editing) in isEditing = editing},
                        minimumValueLabel: Text("min"),
                        maximumValueLabel: Text("max")) {
                            Text("") }
                        
                        .padding(.init(top: 5, leading: 20, bottom: 20, trailing: 20))
                    
                    Spacer()
                    
                    Text("\(peso/(altura * altura), specifier: "%.1f")")
                        
                        .font(.custom("Courier", fixedSize: 55))
                        .padding(.init(top: 30, leading: 30, bottom: 5, trailing: 30))
                    
                    if (peso/(altura * altura)) >= 30 {
                    
                        Text("obesidad")
                            
                            .font(.custom("Courier", fixedSize: 25))
                            .padding(.init(top: 5, leading: 30, bottom: 30, trailing: 30))
                            .foregroundColor(.red)
                        
                    } else if (peso/(altura * altura)) <= 18.5 {
                    
                        Text("insuficiente")
                        
                            .font(.custom("Courier", fixedSize: 25))
                            .padding(.init(top: 5, leading: 30, bottom: 30, trailing: 30))
                            .foregroundColor(.blue)
                        
                    } else if (peso/(altura * altura)) > 18.5 &&  (peso/(altura * altura)) < 25 {
                        
                        Text("normal")
                            
                            .font(.custom("Courier", fixedSize: 25))
                            .padding(.init(top: 5, leading: 30, bottom: 30, trailing: 30))
                            .foregroundColor(.black)
                        
                    } else {
                        
                        Text("sobrepeso")
                            
                            .font(.custom("Courier", fixedSize: 25))
                            .padding(.init(top: 5, leading: 30, bottom: 30, trailing: 30))
                            .foregroundColor(.orange)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
