function validaDados()
{
 
  //verifica campos em branco
  if(document.getElementById("login").value == '')
  {
    alert('Por favor, digite um login');
    return false;
  } 
  if(document.getElementById("nome").value == '')
  {
    alert('Por favor, digite um nome');
    return false;
  }
  if(document.getElementById("email").value == '')
  {
    alert('Por favor, digite um e-mail');
    return false;
  } 
  if(document.getElementById("dataNasc").value == '')
  {
    alert('Por favor, digite a data de nascimento');
    return false;
  }
  if(document.getElementById("senha1").value == '')
  {
    alert('Por favor, digite uma senha');
    return false;
  } 
  if(document.getElementById("senha2").value == '')
  {
    alert('Por favor, connfirme sua senha');
    return false;
  } 
  if(document.getElementById("senha1").value != document.getElementById("senha2").value)
  {
    alert('Senhas não coincidem, tente novamente');
    return false;
  } 

}



//função valida cpf
//função validade idade >= 17

