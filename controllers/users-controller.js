import { connection } from "../utils/db.js";

export const AllUsers = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT email, CONCAT(nome, "", cognome) AS nome_completo, telefono, ruolo, username, two_factor_attivo FROM utente ORDER BY email;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};