import { connection } from "../utils/db.js";

export const AllDispencer = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT d.codice, d.nome, d.tipo, d.alimento, d.unita, d.capacita, d.erogazione_media, r.nome AS recinto, u.nome AS utente_gestore FROM distributori d JOIN recinti r ON r.codice = d.recinto_codice JOIN utente u ON u.email = d.utente_email ORDER BY d.codice;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};