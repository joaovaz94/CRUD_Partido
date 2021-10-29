import React, { useState, useEffect } from "react";
import './App.css';
import Axios from 'axios';

function App() {

  const [numeroFiliado, setNumeroFiliado] = useState("");
  const [cpfFiliado, setCPFFiliado] = useState("");
  const [nomeFiliado, setNomeFiliado] = useState("");
  const [tituloEleitorFiliado, setTituloEleitorFiliado] = useState("");
  const [contribuicaoFiliado, setContribuicaoFiliado] = useState("");
  const [cargoFiliado, setCargoFiliado] = useState("");
  const [zonaEleitoralFiliado, setZonaEleitoralFiliado] = useState("");
  const [telefoneFiliado, setTelefoneFiliado] = useState("");
  const [emailFiliado, setEmailFiliado] = useState("");
  const [estadoFiliado, setEstadoFiliado] = useState("");
  const [cidadeFiliado, setCidadeFiliado] = useState("");
  const [logradouroFiliado, setLogradouroFiliado] = useState("");
  const [listaFiliados, setListaFiliados] = useState([]);
  const [atualizadoFiliado, setAtualizadoFiliado] = useState("");

  useEffect(()=> {
    Axios.get('http://localhost:3001/api/get').then((response)=> {
      setListaFiliados(response.data);
      console.log(response.data);
    })
  }, []);

  const submitCadastro = () => {
    Axios.post('http://localhost:3001/api/insert', {
      numeroFiliado: numeroFiliado, 
      cpfFiliado: cpfFiliado, 
      nomeFiliado: nomeFiliado,
      tituloEleitorFiliado: tituloEleitorFiliado, 
      contribuicaoFiliado: contribuicaoFiliado, 
      cargoFiliado: cargoFiliado, 
      zonaEleitoralFiliado: zonaEleitoralFiliado, 
      telefoneFiliado: telefoneFiliado, 
      emailFiliado: emailFiliado, 
      estadoFiliado: estadoFiliado, 
      cidadeFiliado: cidadeFiliado, 
      logradouroFiliado: logradouroFiliado,
    }).then(()=> {
      alert('inserção bem sucedida')
    });
  };

  const deleteCadastro = (cod) => {
    Axios.delete(`http://localhost:3001/api/delete/${cod}`);
  }

  const updateCadastro = (cod) => {
    Axios.put(`http://localhost:3001/api/update/${cod}`, {

      numeroFiliado: numeroFiliado, 
      cpfFiliado: cpfFiliado, 
      nomeFiliado: nomeFiliado,
      tituloEleitorFiliado: tituloEleitorFiliado, 
      contribuicaoFiliado: contribuicaoFiliado, 
      cargoFiliado: cargoFiliado, 
      zonaEleitoralFiliado: zonaEleitoralFiliado, 
      telefoneFiliado: telefoneFiliado, 
      emailFiliado: emailFiliado, 
      estadoFiliado: estadoFiliado, 
      cidadeFiliado: cidadeFiliado, 
      logradouroFiliado: logradouroFiliado,
    });
  };

  return (
    <div className="App">
      <h1>CRUD de Partido</h1>
      <div className="form">
        <label>Número de Filiação</label>
        <input 
          type="texto" 
          name="numeroFiliado" 
          onChange={(e) => {
            setNumeroFiliado(e.target.value);
          }}
        />
        <label>CPF</label>
        <input 
          type="texto" 
          name="cpfFiliado" 
          onChange={(e) => {
            setCPFFiliado(e.target.value);
          }}
        />
        <label>Nome do Filiado</label>
        <input 
          type="texto" 
          name="nomeFiliado"
          onChange={(e) => {
            setNomeFiliado(e.target.value);
          }}
        />
        <label>Título de Eleitor</label>
        <input 
          type="texto" 
          name="tituloEleitorFiliado" 
          onChange={(e) => {
            setTituloEleitorFiliado(e.target.value);
          }}
        />
        <label>Contribuição</label>
        <input 
          type="texto" 
          name="contribuicaoFiliado" 
          onChange={(e) => {
            setContribuicaoFiliado(e.target.value);
          }}
        />
        <label>Cargo</label>
        <input 
          type="texto" 
          name="cargoFiliado" 
          onChange={(e) => {
            setCargoFiliado(e.target.value);
          }}
        />
        <label>Zona Eleitoral</label>
        <input 
          type="texto" 
          name="zonaEleitoralFiliado" 
          onChange={(e) => {
            setZonaEleitoralFiliado(e.target.value);
          }}
        />
        <label>Telefone</label>
        <input 
          type="texto" 
          name="telefoneFiliado" 
          onChange={(e) => {
            setTelefoneFiliado(e.target.value);
          }}
        />
        <label>Email</label>
        <input 
          type="texto" 
          name="emailFiliado" 
          onChange={(e) => {
            setEmailFiliado(e.target.value);
          }}
        />
        <label>Estado</label>
        <input 
          type="texto" 
          name="estadoFiliado" 
          onChange={(e) => {
            setEstadoFiliado(e.target.value);
          }}
        />
        <label>Cidade</label>
        <input 
          type="texto" 
          name="cidadeFiliado" 
          onChange={(e) => {
            setCidadeFiliado(e.target.value);
          }}
        />
        <label>Logradouro</label>
        <input 
          type="texto" 
          name="logradouroFiliado" 
          onChange={(e) => {
            setLogradouroFiliado(e.target.value);
          }}
        />

        <button onClick={submitCadastro}>Cadastrar</button>

          <br></br>
          <br></br>
          <br></br>

        <div>
          <table className="zui-table">
            <thead>
            <tr>
              <th>Número de Filiação</th>
              <th>CPF</th>
              <th>Nome</th>
              <th>Título de Eleitor</th>
              <th>Contribuição</th>
              <th>Cargo</th>
              <th>Zona Eleitoral</th>
              <th>Telefone</th>
              <th>Email</th>
              <th>Estado</th>
              <th>Cidade</th>
              <th>Loagradouro</th>
              <th>Deletar</th>
              <th>Atualizar</th>
            </tr>
            </thead>
            <tbody>
          {listaFiliados.map(( item, i)=> {
              return (
                <tr>
                  <td key={item.Numero_Filiacao}>{item.Numero_Filiacao}</td>
                  <td key={item.CPF}>{item.CPF}</td>
                  <td key={item.Nome}>{item.Nome}</td>
                  <td key={item.Titulo_Eleitor}>{item.Titulo_Eleitor}</td>
                  <td key={item.Contribuicao}>{item.Titulo_Eleitor}</td>
                  <td key={item.Cargo}>{item.Cargo}</td>
                  <td key={item.Zona_Eleitoral}>{item.Zona_Eleitoral}</td>
                  <td key={item.Telefone}>{item.Telefone}</td>
                  <td key={item.Email}>{item.Email}</td>
                  <td key={item.Estado}>{item.Estado}</td>
                  <td key={item.Cidade}>{item.Cidade}</td>
                  <td key={item.Logradouro}>{item.Logradouro}</td>
                  <td><button onClick={()=> {deleteCadastro(item.Numero_Filiacao)}}>deletar</button></td>
                  <td><button onClick={()=> {updateCadastro(item.Numero_Filiacao)}}>atualizar</button></td>
                </tr>
              );
          })}
          </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

export default App;
