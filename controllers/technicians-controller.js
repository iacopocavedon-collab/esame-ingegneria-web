import { connection } from "../utils/db.js";

export const AllTechnicians = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT codice, CONCAT(nome, "", cognome) AS nome_completo FROM tecnici ORDER BY codice;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};