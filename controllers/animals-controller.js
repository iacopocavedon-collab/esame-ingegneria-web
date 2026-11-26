import { connection } from "../utils/db.js";

export const AllAnimals = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT a.codice, a.nome, a.specie, a.peso AS peso_kg, r.nome AS recinto FROM animali a JOIN recinti r ON r.codice = a.recinto_codice ORDER BY a.codice;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};

export const AllElephants = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT a.codice, a.nome, a.peso, r.nome AS recinto FROM animali a JOIN recinti r ON r.codice = a.recinto_codice WHERE a.specie = "Elefante" ORDER BY a.codice;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};

export const AllGiraffes = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT a.codice, a.nome, a.peso, r.nome AS recinto FROM animali a JOIN recinti r ON r.codice = a.recinto_codice WHERE a.specie = "Giraffa" ORDER BY a.codice;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};
export const AllMonkeys = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT a.codice, a.nome, a.peso, r.nome AS recinto FROM animali a JOIN recinti r ON r.codice = a.recinto_codice WHERE a.specie = "Scimmia" ORDER BY a.codice;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};

export const AllZebras = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT a.codice, a.nome, a.peso, r.nome AS recinto FROM animali a JOIN recinti r ON r.codice = a.recinto_codice WHERE a.specie = "Zebra" ORDER BY a.codice;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};

export const AllTurtles = async(req, res) => {
    try{//esecuzione della query
        const [rows] = await connection.execute('SELECT a.codice, a.nome, a.peso, r.nome AS recinto FROM animali a JOIN recinti r ON r.codice = a.recinto_codice WHERE a.specie = "Tartaruga" ORDER BY a.codice;');
        res.json(rows)
    }catch(error){
        res.status(500).json({error: "Errorre nel recupero dati"});
    }
};