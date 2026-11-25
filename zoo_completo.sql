
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `programmazione_distributori`;
DROP TABLE IF EXISTS `animali`;
DROP TABLE IF EXISTS `distributori`;
DROP TABLE IF EXISTS `programmazione`;
DROP TABLE IF EXISTS `recinti`;
DROP TABLE IF EXISTS `utente`;

CREATE TABLE `utente` (
  `email` VARCHAR(255) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `cognome` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(30) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `ruolo` ENUM('amministratore','veterinario','guardiano') NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `recinti` (
  `codice` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `dimensione` INT NOT NULL,
  PRIMARY KEY (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `programmazione` (
  `codice` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `orario` VARCHAR(5) NOT NULL,
  `utente_email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`codice`),
  CONSTRAINT `fk_prog_utente` FOREIGN KEY (`utente_email`) REFERENCES `utente` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `distributori` (
  `codice` INT NOT NULL,
  `nome` VARCHAR(150) NOT NULL,
  `tipo` ENUM('cibo','acqua','integratori') NOT NULL,
  `percentuale` INT NOT NULL,
  `recinto_codice` INT NOT NULL,
  `utente_email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`codice`),
  CONSTRAINT `fk_dist_recinto` FOREIGN KEY (`recinto_codice`) REFERENCES `recinti` (`codice`),
  CONSTRAINT `fk_dist_utente` FOREIGN KEY (`utente_email`) REFERENCES `utente` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `animali` (
  `codice` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `specie` VARCHAR(50) NOT NULL,
  `peso` DOUBLE NOT NULL,
  `recinto_codice` INT NOT NULL,
  PRIMARY KEY (`codice`),
  CONSTRAINT `fk_ani_recinto` FOREIGN KEY (`recinto_codice`) REFERENCES `recinti` (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `programmazione_distributori` (
  `programmazione_codice` INT NOT NULL,
  `distributore_codice` INT NOT NULL,
  PRIMARY KEY (`programmazione_codice`, `distributore_codice`),
  CONSTRAINT `fk_pd_prog` FOREIGN KEY (`programmazione_codice`) REFERENCES `programmazione` (`codice`),
  CONSTRAINT `fk_pd_dist` FOREIGN KEY (`distributore_codice`) REFERENCES `distributori` (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `utente` (`email`, `nome`, `cognome`, `telefono`, `password`, `ruolo`) VALUES
('alba.pizzo@icloud.com', 'Alba', 'Pizzo', '+39 5708186590', '2a97eee1525d941d139e72f8e71380059415fe184c90d293211193be28a9c517', 'guardiano'),
('anita.luciano@gmail.com', 'Anita', 'Luciano', '+39 5944657923', 'a1a0c4c6edeac49d64ddd39fc666a0a234eb4fb94b16a8f2cbcf247e507d7151', 'amministratore'),
('cristiano.sartori@gmail.com', 'Cristiano', 'Sartori', '+39 8292199310', '343b6c84bca7efb7dc2f3663b1dbf4962732cfdcf39537dd4e13dabeb94bdb80', 'veterinario'),
('davide.agostini@gmail.com', 'Davide', 'Agostini', '+39 4193371572', 'c403a11b841fe0e7f211cf725c24a1a0ceb76a2e52e29b066ec6761160fed665', 'amministratore'),
('eleonora.gatti@icloud.com', 'Eleonora', 'Gatti', '+39 6247682616', 'f7f7dbbcdbbb5298364b982b6adad1d1951d7b9da7d8cb6593731f051c1865bb', 'guardiano'),
('franco.cattaneo@icloud.com', 'Franco', 'Cattaneo', '+39 3927673736', 'c5585798131cee700c42ad0d9a3dd6aaf71849141d025ebedb4d3ea3a0143ff0', 'guardiano'),
('gabriele.deluca@gmail.com', 'Gabriele', 'De Luca', '+39 3596044487', 'ae218a2743f5405666a5652af0d024c134907c8d00cff862d4138c1a115174ee', 'veterinario'),
('mauro.martini@icloud.com', 'Mauro', 'Martini', '+39 0532918175', '20e98f9901566a07ad39b14de7c9ea32d9f174e33adfa397de16c43b4638c110', 'guardiano'),
('milena.gentile@gmail.com', 'Milena', 'Gentile', '+39 4039403707', 'a5f7234d7f10704796f0a51d04446b532527eb0298180091bced0043c3c12018', 'guardiano'),
('nicoletta.rinaldi@gmail.com', 'Nicoletta', 'Rinaldi', '+39 8418544246', 'cfbb27bb44d3bc46ebb470dc7b65f5e44f35cba1aee6dde8ae1116799145d635', 'veterinario'),
('pio.morrone@gmail.com', 'Pio', 'Morrone', '+39 2242306634', 'f11dfe7598410f30b1bfbb3c825eb0077c5df855879b888cef812d450f4a64ca', 'guardiano'),
('riccardo.costa@hotmail.com', 'Riccardo', 'Costa', '+39 3464775929', '0b65e6f343b9f2caeb89a412dafa6ff26123337de6f84fa65746273fde12961c', 'guardiano'),
('viola.carbone@yahoo.com', 'Viola', 'Carbone', '+39 0191809253', 'd282329bd5c7a8738a76a9e4878090538ca18c4b196eec540eefaa6d0695ed81', 'guardiano'),
('vittoria.valente@gmail.com', 'Vittoria', 'Valente', '+39 9811237518', '676f2414e886156291a5f7f3f8350171ee81ae5796711b3b70c41b3a7eceab45', 'guardiano'),
('vittorio.petrillo@yahoo.com', 'Vittorio', 'Petrillo', '+39 6563697264', 'f93f613464420c0cf4c2996edca2e9595b4943d37eeb8da8a4e9f420bcf8ee53', 'veterinario');

INSERT INTO `recinti` (`codice`, `nome`, `dimensione`) VALUES
(1, 'Savana degli Elefanti', 5440),
(2, 'Altopiano delle Giraffe', 4220),
(3, 'Pianura delle Zebre', 3190),
(4, 'Foresta delle Scimmie', 1700),
(5, 'Stagno delle Tartarughe', 790);

INSERT INTO `programmazione` (`codice`, `nome`, `orario`, `utente_email`) VALUES
(1, 'Colazione elefanti', '07:30', 'cristiano.sartori@gmail.com'),
(2, 'Pranzo elefanti', '12:30', 'gabriele.deluca@gmail.com'),
(3, 'Cena elefanti', '17:30', 'vittorio.petrillo@yahoo.com'),
(4, 'Colazione giraffe', '08:00', 'nicoletta.rinaldi@gmail.com'),
(5, 'Pranzo giraffe', '13:00', 'riccardo.costa@hotmail.com'),
(6, 'Cena giraffe', '17:00', 'franco.cattaneo@icloud.com'),
(7, 'Colazione zebre', '07:45', 'vittoria.valente@gmail.com'),
(8, 'Pranzo zebre', '12:45', 'mauro.martini@icloud.com'),
(9, 'Cena zebre', '17:15', 'viola.carbone@yahoo.com'),
(10, 'Colazione scimmie', '08:30', 'pio.morrone@gmail.com'),
(11, 'Pranzo scimmie', '12:00', 'alba.pizzo@icloud.com'),
(12, 'Merenda scimmie', '16:00', 'milena.gentile@gmail.com'),
(13, 'Colazione tartarughe', '09:00', 'eleonora.gatti@icloud.com'),
(14, 'Pranzo tartarughe', '13:00', 'cristiano.sartori@gmail.com'),
(15, 'Cena tartarughe', '17:00', 'gabriele.deluca@gmail.com');

INSERT INTO `distributori` (`codice`, `nome`, `tipo`, `percentuale`, `recinto_codice`, `utente_email`) VALUES
(1, 'Distributore di cibo - Savana degli Elefanti', 'cibo', 12, 1, 'riccardo.costa@hotmail.com'),
(2, 'Distributore d''acqua - Savana degli Elefanti', 'acqua', 97, 1, 'franco.cattaneo@icloud.com'),
(3, 'Distributore di integratori - Savana degli Elefanti', 'integratori', 84, 1, 'vittoria.valente@gmail.com'),
(4, 'Distributore di cibo - Altopiano delle Giraffe', 'cibo', 19, 2, 'mauro.martini@icloud.com'),
(5, 'Distributore d''acqua - Altopiano delle Giraffe', 'acqua', 9, 2, 'viola.carbone@yahoo.com'),
(6, 'Distributore di integratori - Altopiano delle Giraffe', 'integratori', 96, 2, 'pio.morrone@gmail.com'),
(7, 'Distributore di cibo - Pianura delle Zebre', 'cibo', 44, 3, 'alba.pizzo@icloud.com'),
(8, 'Distributore d''acqua - Pianura delle Zebre', 'acqua', 74, 3, 'milena.gentile@gmail.com'),
(9, 'Distributore di integratori - Pianura delle Zebre', 'integratori', 19, 3, 'eleonora.gatti@icloud.com'),
(10, 'Distributore di cibo - Foresta delle Scimmie', 'cibo', 43, 4, 'riccardo.costa@hotmail.com'),
(11, 'Distributore d''acqua - Foresta delle Scimmie', 'acqua', 28, 4, 'franco.cattaneo@icloud.com'),
(12, 'Distributore di integratori - Foresta delle Scimmie', 'integratori', 51, 4, 'vittoria.valente@gmail.com'),
(13, 'Distributore di cibo - Stagno delle Tartarughe', 'cibo', 30, 5, 'mauro.martini@icloud.com'),
(14, 'Distributore d''acqua - Stagno delle Tartarughe', 'acqua', 77, 5, 'viola.carbone@yahoo.com'),
(15, 'Distributore di integratori - Stagno delle Tartarughe', 'integratori', 90, 5, 'pio.morrone@gmail.com');

INSERT INTO `animali` (`codice`, `nome`, `specie`, `peso`, `recinto_codice`) VALUES
(1, 'Jumbo', 'Elefante', 4264.4, 1),
(2, 'Mara', 'Elefante', 3586, 1),
(3, 'Bomba', 'Elefante', 3637.6, 1),
(4, 'Kiko', 'Giraffa', 1028.5, 2),
(5, 'Zawadi', 'Giraffa', 859.6, 2),
(6, 'Jaffa', 'Giraffa', 1126.8, 2),
(7, 'Nala', 'Giraffa', 995.9, 2),
(8, 'Geraldine', 'Giraffa', 884.2, 2),
(9, 'Zora', 'Zebra', 390.3, 3),
(10, 'Stripe', 'Zebra', 258.2, 3),
(11, 'Rafiki', 'Zebra', 261.4, 3),
(12, 'Marty', 'Zebra', 373.9, 3),
(13, 'Bibi', 'Zebra', 392.8, 3),
(14, 'Dora', 'Zebra', 285.7, 3),
(15, 'Zuma', 'Zebra', 333, 3),
(16, 'Banana', 'Scimmia', 6.7, 4),
(17, 'Momo', 'Scimmia', 10.5, 4),
(18, 'Cita', 'Scimmia', 31.7, 4),
(19, 'Titti', 'Scimmia', 16.6, 4),
(20, 'Rocco', 'Scimmia', 8.7, 4),
(21, 'Gino', 'Scimmia', 10.5, 4),
(22, 'Nina', 'Scimmia', 33.3, 4),
(23, 'Lilli', 'Scimmia', 7.2, 4),
(24, 'Gigi', 'Scimmia', 32.2, 4),
(25, 'Mimi', 'Scimmia', 22.6, 4),
(26, 'Pippo', 'Scimmia', 24, 4),
(27, 'Tarzan', 'Scimmia', 13.7, 4),
(28, 'Kiki', 'Scimmia', 25.4, 4),
(29, 'Fufi', 'Scimmia', 15.2, 4),
(30, 'Coco', 'Scimmia', 22.6, 4),
(31, 'Leo', 'Tartaruga', 84.3, 5),
(32, 'Donatello', 'Tartaruga', 108.4, 5),
(33, 'Speedy', 'Tartaruga', 33.3, 5),
(34, 'Guscio', 'Tartaruga', 27.3, 5),
(35, 'Ugo', 'Tartaruga', 48.8, 5),
(36, 'Gilda', 'Tartaruga', 13.6, 5),
(37, 'Dante', 'Tartaruga', 92.7, 5),
(38, 'Nonna Rosa', 'Tartaruga', 105.1, 5),
(39, 'Mina', 'Tartaruga', 74.2, 5),
(40, 'Tommaso', 'Tartaruga', 108.9, 5),
(41, 'Tato', 'Tartaruga', 91.9, 5),
(42, 'Tina', 'Tartaruga', 93.8, 5),
(43, 'Raffaello', 'Tartaruga', 27.8, 5),
(44, 'Bruno', 'Tartaruga', 75.5, 5),
(45, 'Nemo', 'Tartaruga', 21.4, 5),
(46, 'Perla', 'Tartaruga', 78.2, 5),
(47, 'Olga', 'Tartaruga', 12.7, 5),
(48, 'Lenta', 'Tartaruga', 100.6, 5),
(49, 'Pina', 'Tartaruga', 72, 5),
(50, 'Sasso', 'Tartaruga', 77.6, 5);

INSERT INTO `programmazione_distributori` (`programmazione_codice`, `distributore_codice`) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 1),
(3, 3),
(4, 4),
(5, 4),
(5, 5),
(6, 4),
(6, 6),
(7, 7),
(8, 7),
(8, 8),
(9, 7),
(9, 9),
(10, 10),
(11, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 13),
(14, 14),
(15, 13),
(15, 15);

SET FOREIGN_KEY_CHECKS=1;
