document.getElementById("cad_aluno").onsubmit=
function(event){
	
	var campologin = document.getElementById("login");
	var camponomecompleto = document.getElementById("nomecompleto");
	var campoemail = document.getElementById("email");
	var camponascimento = document.getElementById("nascimento");
	var campocpf = document.getElementById("cpf");
	var camposenha = document.getElementById("senha");
	var campoconfirmsenha = document.getElementById("confirmsenha");
		
    if(campologin.value==""){
        alert("Por favor, preencha o campo login.");
        return false;
    }
	
    else if(camponomecompleto.value==""){
        alert("Por favor, preencha o campo nome completo");
        return false;
    }
	
    else if(campoemail.value==""){
        alert("Por favor, preencha o campo e-mail");
        return false;
    }
	
    else if(camponascimento.value==""){
        alert("Por favor, preencha o campo nascimento");
        return false;
    }
	
    else if(campocpf.value == ""){
        alert("Por favor, preencha o campo CPF");
        return false;
    }

	else if(camposenha.value == ""){
		alert("Por favor, preencha o campo senha");
		return false;
	}

	else if(campoconfirmsenha.value == ""){
		alert("Por favor, preencha o campo confirmar senha");
		return false;
	}
	else if(campoconfirmsenha.value != camposenha.value){
		alert("Senhas não conferem");
		return false;
	}
  
}

document.getElementById("cpf").onsubmit=
  function validaCPF(cpf) {
    var numeros, digitos, soma, i, resultado, digitos_iguais;
    digitos_iguais = 1;
    if (cpf.length < 11)
          return false;
    for (i = 0; i < cpf.length - 1; i++)
          if (cpf.charAt(i) != cpf.charAt(i + 1))
                {
                digitos_iguais = 0;
                break;
                }
    if (!digitos_iguais)
          {
          numeros = cpf.substring(0,9);
          digitos = cpf.substring(9);
          soma = 0;
          for (i = 10; i > 1; i--)
                soma += numeros.charAt(10 - i) * i;
          resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
          if (resultado != digitos.charAt(0))
                return false;
          numeros = cpf.substring(0,10);
          soma = 0;
          for (i = 11; i > 1; i--)
                soma += numeros.charAt(11 - i) * i;
          resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
          if (resultado != digitos.charAt(1))
                return false;
          return true;
          }
    else
		alert("CPF Inválido");
        return false;
  }
	









	
