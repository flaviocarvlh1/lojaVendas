function validarIdade() {
    const dataNascimento = document.getElementById('data_nascimento').value;

    if (!dataNascimento) {
        alert('Por favor, insira sua data de nascimento.');
        return false;
    }

    const hoje = new Date();
    const nascimento = new Date(dataNascimento);

   
    let idade = hoje.getFullYear() - nascimento.getFullYear();
    const mes = hoje.getMonth() - nascimento.getMonth();

    if (mes < 0 || (mes === 0 && hoje.getDate() < nascimento.getDate())) {
        idade--;
    }

    if (idade < 18) {
        alert('Você precisa ter pelo menos 18 anos para concluir a compra.');
        return false;
    }

    return true;
}