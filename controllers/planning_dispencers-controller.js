import { connection } from "../utils/db.js";

export const AllPlanningDispencers = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT pd.programmazione_codice, p.nome AS nome_programmazione, pd.distributore_codice, d.nome AS nome_distributore FROM programmazione_distributori pd JOIN programmazione p ON p.codice = pd.programmazione_codice JOIN distributori d ON d.codice = pd.distributore_codice ORDER BY pd.programmazione_codice, pd.distributore_codice;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};