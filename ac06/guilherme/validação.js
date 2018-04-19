function validacao(){
    if(document.form.login.value=="") {
        alert("Por favor, preencha o campo login.");
        document.form.login.focus();
        return false;
    }
    if(document.form.nome.value=="") {
        alert("Por favor, preencha o campo nome.'");
        document.form.nome.focus();
        return false;
    }
    if(document.form.email.value==""){
        alert("Por favor, preencha o campo e-mail");
        document.form.email.focus();
        return false;
    }
    if(document.form.nascimento.value==""){
        alert("Por favor, preencha o campo nascimento.");
        document.form.nascimento.focus();
        return false;
    }
    if(document.form.cpf.value==""){
        alert("Por favor, preencha o campo CPF.");
        document.form.cpf.focus();
        return false;
    }
    if(document.form.senha.value==""){
        alert("Por favor, preencha o campo senha.");
        document.form.senha.focus();
        return false;
    }
    if(document.form.confirmsenha.value==""){
        alert("Por favor, preencha o campo confirmar senha.")
        document.form.confirmsenha.focus();
        return false
    }
    

}
