import { createConnection } from "mysql2/promise";

export const connection = await createConnection({ //creazione connessione
    host: "localhost",
    user: "root",
    password: "",
    database: "zoo",
})