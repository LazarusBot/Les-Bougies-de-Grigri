//
//  CartView.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 20/03/2023.
//

import SwiftUI

extension Int: VectorArithmetic {
    mutating public func scale(by rhs: Double) {
        self = Int(Double(self) * rhs)
    }
    
    public var magnitudeSquared: Double {
        Double(self * self)
    }
}

struct AnimatableNumberModifier: AnimatableModifier {
    var number: Int
    
    var animatableData: Int {
        get { number }
        set { number = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Text("$ \(number).00")
                    .font(.title2)
                    .foregroundColor(.orange)
                    .fontWeight(.heavy)
            )
    }
}

extension View {
    func animatingOverlay(for number: Int) -> some View {
        modifier(AnimatableNumberModifier(number: number))
    }
}


struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    @State var showTrash: Bool = false
    @Namespace var animation
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    if cartManager.CartProducts.isEmpty {
                        Group {
                            Image("S9")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                                .padding()
                                .padding(.top, 90)
                            
                            Text("The cart is empty...")
                                .font(.title).bold()
                            
                            Text("Add some products in the product's detail.")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                                .padding(.top, 10)
                                .multilineTextAlignment(.leading)
                        }
                    } else {
                        
                        VStack {
                            
                            ForEach(cartManager.CartProducts) {product in
                                
                                HStack(spacing: 0) {
                                    
                                    if showTrash {
                                        
                                        Button {
                                            withAnimation{
                                                cartManager.removeFromCart(product: product)
                                            }
                                        } label: {
                                            Image(systemName: "minus.circle.fill")
                                                .font(.title2)
                                                .foregroundColor(.red)
                                        }
                                        .padding(.trailing)
                                    }
                                    
                                    CartRow(item: product)
                                }
                                .padding()
                                
                            }
                            
                            Spacer()
                            
                            if cartManager.total != 0 {
                                ZStack {
                                    
                                    VStack {
                                        HStack {
                                            Image(systemName: "creditcard")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 30, height: 20)
                                            
                                            
                                            Spacer(minLength: 200)
                                            
                                            
                                            Color.clear
                                                .animatingOverlay(for: cartManager.total)
                                            
                                        }
                                        
                                        PaymentButton(action: {})
                                            .padding(.vertical, 20)
                                            .shadow(radius: 5)
                                    }
                                    .padding()
                                    .background(
                                        Color.white
                                            .cornerRadius(15)
                                            .shadow(radius: 5)
                                    )
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
            .navigationTitle(Text("My Cart"))
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            showTrash.toggle()
                        }
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    
                }
            }
            .padding(.top)
            
            
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
