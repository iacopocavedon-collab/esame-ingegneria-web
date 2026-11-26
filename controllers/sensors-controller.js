import { connection } from "../utils/db.js";

export const AllSensors = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT s.codice, s.nome, s.tipo, s.sigla, s.valore, s.unita_misura, s.soglia_min, s.soglia_max, s.stato, d.nome AS distributore FROM sensori s JOIN distributori d ON d.codice = s.distributore_codice ORDER BY s.distributore_codice, s.codice;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};