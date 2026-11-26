import { connection } from "../utils/db.js";

export const AllPlanning = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT p.codice, p.nome, p.orario, u.nome AS utente_gestore FROM programmazione p JOIN utente u ON u.email = p.utente_email ORDER BY p.codice;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};