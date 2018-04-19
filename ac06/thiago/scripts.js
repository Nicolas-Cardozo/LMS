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
        return False;
    }
	
    else if(camponomecompleto.value==""){
        alert("Por favor, preencha o campo nome completo");
        return False;
    }
	
    else if(campoemail.value==""){
        alert("Por favor, preencha o campo e-mail");
        return False;
    }
	
    else if(camponascimento.value==""){
        alert("Por favor, preencha o campo nascimento");
        return False;
    }
	
    else if(campocpf.value == ""){
        alert("Por favor, preencha o campo CPF");
        return False;
    }

	else if(camposenha.value == ""){
		alert("Por favor, preencha o campo senha");
		return False;
	}

	else if(campoconfirmsenha.value == ""){
		alert("Por favor, preencha o campo confirmar senha");
		return False;
	}
	else if(campoconfirmsenha.value != camposenha.value){
		alert("Senhas não conferem");
		return False;
	}
  
	
 }

	