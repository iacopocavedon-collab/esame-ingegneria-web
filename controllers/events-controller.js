import { connection } from "../utils/db.js";

export const AllEvents = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT e.codice, e.titolo, e.data_ora, e.tipo, e.note, r.nome AS recinto, d.nome AS distributore, u.nome AS utente_registratore FROM eventi e LEFT JOIN recinti r ON r.codice = e.recinto_codice LEFT JOIN distributori d ON d.codice = e.distributore_codice JOIN utente u ON u.email = e.utente_email ORDER BY e.data_ora DESC;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};