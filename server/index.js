const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();
const mysql = require('mysql');

const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'Partido_Politico'
});

app.use(cors());
//app.use(express.urlencoded({ extended: true }))
app.use(express.json());
app.use(bodyParser.urlencoded({extended: true}))

app.get('/api/get', (req, res)=> {
    const sqlSelect = "SELECT * FROM Filiado";
    db.query(sqlSelect, (err, result)=> {
        res.send(result);
        //console.log(result);
    });
});

app.post("/api/insert", (req, res)=> {

    const numeroFiliado = req.body.numeroFiliado;
    const cpfFiliado= req.body.cpfFiliado;
    const nomeFiliado= req.body.nomeFiliado;
    const tituloEleitorFiliado= req.body.tituloEleitorFiliado; 
    const contribuicaoFiliado= req.body.contribuicaoFiliado;
    const cargoFiliado= req.body.cargoFiliado;
    const zonaEleitoralFiliado= req.body.zonaEleitoralFiliado;
    const telefoneFiliado= req.body.telefoneFiliado;
    const emailFiliado= req.body.emailFiliado;
    const estadoFiliado= req.body.estadoFiliado; 
    const cidadeFiliado= req.body.cidadeFiliado;
    const logradouroFiliado= req.body.logradouroFiliado;

    //console.log(filiadoNome);

    const sqlInsert = "INSERT INTO Filiado (Numero_Filiacao, CPF, Nome, Titulo_Eleitor, Contribuicao, Cargo, Zona_Eleitoral, Telefone, Email, Estado, Cidade, Logradouro) VALUES (? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"
    db.query(sqlInsert, [numeroFiliado, cpfFiliado, nomeFiliado,tituloEleitorFiliado , contribuicaoFiliado, cargoFiliado, zonaEleitoralFiliado, telefoneFiliado, emailFiliado, estadoFiliado, cidadeFiliado, logradouroFiliado], (err, result)=> {
        console.log(result);
    })
});

app.delete('/api/delete/:numeroFiliado', (req, res)=> {
    const numero = req.params.numeroFiliado;
    const sqlDelete = "DELETE FROM Filiado WHERE Numero_Filiacao = ?";
    db.query(sqlDelete,numero, (err, result)=> {
        if (err) console.log(err);
    });
});

app.put('/api/update/:numeroFiliado', (req, res)=> {
    
    const numero = req.params.numeroFiliado;

    const numeroFiliado = req.body.numeroFiliado;
    const cpfFiliado= req.body.cpfFiliado;
    const nomeFiliado= req.body.nomeFiliado;
    const tituloEleitorFiliado= req.body.tituloEleitorFiliado; 
    const contribuicaoFiliado= req.body.contribuicaoFiliado;
    const cargoFiliado= req.body.cargoFiliado;
    const zonaEleitoralFiliado= req.body.zonaEleitoralFiliado;
    const telefoneFiliado= req.body.telefoneFiliado;
    const emailFiliado= req.body.emailFiliado;
    const estadoFiliado= req.body.estadoFiliado; 
    const cidadeFiliado= req.body.cidadeFiliado;
    const logradouroFiliado= req.body.logradouroFiliado;

    const sqlUpdate = "UPDATE Filiado SET Numero_Filiacao = ?, CPF = ?, Nome = ?, Titulo_Eleitor = ?, Contribuicao = ?, Cargo = ?, Zona_Eleitoral = ?, Telefone = ?, Email = ?, Estado = ?, Cidade = ?, Logradouro = ?  WHERE Numero_Filiacao = ?";
    db.query(sqlUpdate,[numeroFiliado, cpfFiliado, nomeFiliado, tituloEleitorFiliado, contribuicaoFiliado, cargoFiliado, zonaEleitoralFiliado, telefoneFiliado, emailFiliado, estadoFiliado, cidadeFiliado, logradouroFiliado ,numero], (err, result)=> {
        if (err) console.log(err);
    });
});

app.listen(3001, () => {
    console.log("rodando na porta 3001");
});