import { connection } from "../utils/db.js";

export const AllEnclosures = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT codice, nome, dimensione, url_cam, stato_cam FROM recinti ORDER BY codice;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};