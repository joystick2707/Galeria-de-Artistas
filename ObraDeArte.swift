import Foundation

/// Modelo de dados que representa uma obra de arte.
struct ObraDeArte: Identifiable {
    
    /// Identificador único da obra.
    let id: UUID
    
    /// Título da obra 
    let titulo: String
    
    /// Nome do artista responsável pela obra.
    let artista: String
    
    /// Ano de criação 
    let ano: Int
    
    /// Estilo ou técnica artística da obra 
    let estilo: String
    
    /// Nome do arquivo da imagem associada à obra no Assets.
    let imagemNome: String
    
    /// Descrição detalhada da obra de arte.
    let descricao: String
}
