/*
drop table segnalazione
drop table recensione
drop table notifica_utente
drop table prenotazione_periferica
drop table notifica
drop table periferica
drop table prenotazione
drop table postazione
drop table utente
drop table categoria
*/

CREATE TABLE notifica(
    id INT PRIMARY KEY NOT NULL IDENTITY (1, 1),
    descrizione VARCHAR(50) NOT NULL,
    tipo VARCHAR(20)
)
INSERT INTO notifica(descrizione,tipo) VALUES('PROVA','1');
INSERT INTO notifica(descrizione,tipo) VALUES('PROVA','2');
INSERT INTO notifica(descrizione,tipo) VALUES('PROVA','3');

/*SELECT * from utente
*/



CREATE TABLE utente(
    email VARCHAR(30) PRIMARY KEY NOT NULL,
    nome VARCHAR(30) NOT NULL,
    cognome VARCHAR(30) NOT NULL,
    username VARCHAR(30) NOT NULL,
    passw BINARY(32) NOT NULL,
    ruolo VARCHAR(10) NOT NULL,
    stato BIT NOT NULL DEFAULT 'FALSE',
    CHECK (ruolo in ('cliente','titolare','gestore')),
    codiceVerifica char(7),
    immagine VARCHAR(MAX)
)


SELECT*FROM utente

Delete from utente where email='titolare1@titolare.com'

CREATE TABLE segnalazione(
    id INT PRIMARY KEY NOT NULL IDENTITY (1, 1),
    tipo VARCHAR(10) NOT NULL,
    descrizione VARCHAR(100) NOT NULL,
    utenteEmail VARCHAR(30) NOT NULL,
    FOREIGN KEY (UtenteEmail) REFERENCES utente(email) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE recensione(
    descrizione VARCHAR(200) NOT NULL,
    valutazione INT NOT NULL,
    verificata bit NOT NULL DEFAULT 'FALSE',
    utenteEmail VARCHAR(30) NOT NULL PRIMARY KEY,
    FOREIGN KEY (UtenteEmail) REFERENCES utente(email) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE periferica(
    tipo VARCHAR(20) NOT NULL,
    nome VARCHAR(20) NOT NULL PRIMARY KEY,
    quantita INTEGER NOT NULL,
    prezzo FLOAT NOT NULL
)
CREATE TABLE categoria(
    nome VARCHAR(15) PRIMARY KEY NOT NULL,
    tipoGenerico VARCHAR(15) NOT NULL,
    prezzo FLOAT NOT NULL,
    descrizione VARCHAR(100) NOT NULL,
    immagine VARCHAR(MAX) NOT NULL
)
/*
INSERT INTO categoria VALUES('PC fascia alta','PC',5,'PROVA','data:image/jpeg;base64,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')
INSERT INTO categoria VALUES('Console','PS5',5,'PROVA','data:image/jpeg;base64,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')
INSERT INTO categoria VALUES('VR','Oculus',5,'PROVA','data:image/jpeg;base64,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')
*/
CREATE TABLE postazione(
    id INT PRIMARY KEY NOT NULL IDENTITY (1, 1),
    nomeCategoria VARCHAR(15) NOT NULL,
    isDisponibile BIT NOT NULL DEFAULT 'TRUE',
    FOREIGN KEY (nomeCategoria) REFERENCES categoria(nome) ON DELETE CASCADE ON UPDATE CASCADE
)


CREATE TABLE prenotazione(
    id INT PRIMARY KEY NOT NULL IDENTITY (1, 1),
    dataPrenotazione DATE NOT NULL,
    fasciaOraria CHAR(5) NOT NULL,
    qR VARCHAR(MAX),/*è un'immagine*/
    utenteEmail VARCHAR(30) NOT NULL,
    postazioneId INT NOT NULL,
    prezzo FLOAT NOT NULL,
    FOREIGN KEY (postazioneid) REFERENCES postazione(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (UtenteEmail) REFERENCES utente(email) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE notifica_utente(
    notificaId INT NOT NULL,
    utenteEmail VARCHAR(30) NOT NULL,
    isRead BIT NOT NULL DEFAULT 'FALSE',
    PRIMARY KEY(notificaId,UtenteEmail),
    FOREIGN KEY (UtenteEmail) REFERENCES utente(email) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (notificaId) REFERENCES notifica(id) ON DELETE CASCADE ON UPDATE CASCADE
)

SELECT * from notifica_utente

CREATE TABLE prenotazione_periferica(
    prenotazioneId INT NOT NULL,
    perifericaNome VARCHAR(20) NOT NULL,
    PRIMARY KEY(prenotazioneId,perifericaNome),
    FOREIGN KEY(prenotazioneId) REFERENCES prenotazione(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(perifericaNome) REFERENCES periferica(nome) ON DELETE CASCADE ON UPDATE CASCADE
)


SELECT * FROM postazione p where 2 NOT IN(
	SELECT pr.postazioneId FROM prenotazione pr)


select *from categoria

SELECT p.nome, (p.quantita-(
SELECT COUNT(*) FROM  prenotazione pr, prenotazione_periferica pp
	 WHERE p.nome=pp.perifericaNome AND pr.id=pp.prenotazioneId 
		AND pr.dataPrenotazione='12/02/2020' AND pr.fasciaOraria='16/18')) as quantitaDisponibile
    FROM periferica p
    