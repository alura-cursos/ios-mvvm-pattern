//
//  HomeViewModel.swift
//  Vollmed
//
//  Created by ALURA on 06/10/23.
//

import Foundation

struct HomeViewModel {
    
    // MARK: - Attributes
    
    let service: HomeServiceable
    var authManager = AuthenticationManager.shared
    
    // MARK: - Init
    
    init(service: HomeServiceable) {
        self.service = service
    }
    
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
    
    func logout() async {
        do {
            let response = try await service.logoutPatient()
            if response {
                authManager.removeToken()
                authManager.removePatientID()
            }
        } catch {
            print("ocorreu um erro no logout: \(error)")
        }
    }
}
