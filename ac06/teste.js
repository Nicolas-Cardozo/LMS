//testes de validação javascript -- não ok

function validaDados()
{
 
  //verifica campos em branco
  if(document.getElementById("nome").value == '')
  {
    alert('Insira um nome');
    return false;
  }
  
  if(document.getElementById("dataNasc").value == '')
  {
    alert('Insira data de nascimento');
    return false;
  }
  
  if (document.getElementById("dataNasc").value) != '')
  {
	new Date()
    alert('Idade não permitida');
    return false;
  }
  
  if(document.getElementById("cpf").value == '')
  {
    alert('Insira um CPF');
    return false;
  }

  if(document.getElementById("senha1").value == '')
  {
    alert('Insira uma senha');
    return false;
  }
  
  if(document.getElementById("senha2").value == '')
  {
    alert('Confirme sua senha');
    return false;
  }
  
  if(document.getElementById("senha2").value != "senha1")
  {
    alert('Senhas não conferem');
    return false;
  }
  var nome = document.getElementById("nome").value;
  var dataNasc = document.getElementById("dataNasc").value;
  var cpf = document.getElementById("cpf").value;
  var senha1 = document.getElementById("senha1").value;
  var senha2 = document.getElementById("senha2").value;

  //inserir aqui funções de validação
  //validaIdade()
  //validaCPF()
  //validaSenha()
  paginaMatricula();
  // atualizaMatricula();
}

function paginaMatricula()
{
  window.location.href = 'matricula.html';
}

atualizaMatricula();

function atualizaMatricula()
{
  tabela = document.getElementById("tabMatricula");
  linha = tabela.insertRow(1);
  coluna1 = linha.insertCell(0);
  coluna2 = linha.insertCell(1);
  coluna1.innerHTML = '00001';
  coluna2.innerHTML = 'Kallyne';

}
