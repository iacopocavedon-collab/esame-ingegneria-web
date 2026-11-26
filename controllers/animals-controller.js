import { connection } from "../utils/db.js";

export const AllAnimals = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT a.codice, a.nome, a.specie, a.peso AS peso_kg, r.nome AS recinto FROM animali a JOIN recinti r ON r.codice = a.recinto_codice ORDER BY a.codice;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errore nel recupero dati"});
    }
};

