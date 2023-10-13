//
//  HomeViewModel.swift
//  Vollmed
//
//  Created by ALURA on 06/10/23.
//

import Foundation

struct HomeViewModel {
    
    // MARK: - Attributes
    
    let service = WebService()
    
    // MARK: - Class methods
    
    func getSpecialists() async throws -> [Specialist] {
        do {
            if let fetchedSpecialists = try await service.getAllSpecialists() {
                return fetchedSpecialists
            }
            
            return []
        } catch {
            print("Ocorreu um problema para obter os especialistas")
            throw error
        }
    }
    
}
