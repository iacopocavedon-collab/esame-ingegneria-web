import { connection } from "../utils/db.js";

export const AllMaintenance = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT m.codice, m.data_ora, m.interventi, m.prossima_revisione, d.nome AS distributore, CONCAT(t.nome, "", t.cognome) AS tecnico FROM manutenzioni m JOIN distributori d ON d.codice = m.distributore_codice JOIN tecnici t ON t.codice = m.tecnico_codice ORDER BY m.data_ora DESC;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};