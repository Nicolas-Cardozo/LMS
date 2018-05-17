document.getElementById("cad_aluno").onsubmit=
function(event){
	
	var campologin = document.getElementById("login");
	var camponomecompleto = document.getElementById("nomecompleto");
	var campoemail = document.getElementById("email");
	var camponascimento = document.getElementById("nascimento");
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

function verificarCPF(c){
    var i;
    s = c;
    var c = s.substr(0,9);
    var dv = s.substr(9,2);
    var d1 = 0;
    var v = false;
	var campocpf = document.getElementById("cpf");
	
	if(campocpf.value == ""){
       alert("Por favor, preencha o campo CPF");
       return false;
    }
 
    for (i = 0; i < 9; i++){
        d1 += c.charAt(i)*(10-i);
    }
    if (d1 == 0){
        alert("CPF Inválido")
        v = true;
        return false;
    }
    d1 = 11 - (d1 % 11);
    if (d1 > 9) d1 = 0;
    if (dv.charAt(0) != d1){
        alert("CPF Inválido")
        v = true;
        return false;
    }
 
    d1 *= 2;
    for (i = 0; i < 9; i++){
        d1 += c.charAt(i)*(11-i);
    }
    d1 = 11 - (d1 % 11);
    if (d1 > 9) d1 = 0;
    if (dv.charAt(1) != d1){
        alert("CPF Inválido")
        v = true;
        return false;
    }
    if (!v) {
        /*alert(c + "nCPF Válido")*/
    }
}
	









	