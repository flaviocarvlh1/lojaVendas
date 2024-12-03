const inputs = document.querySelectorAll('.quantidade');
const totalElement = document.getElementById('total');
const totalHiddenInput = document.getElementById('total_hidden');

function atualizarTotal() {
    let total = 0;
    inputs.forEach(item => {
        const preco = parseFloat(item.getAttribute('data-preco'));
        const quantidade = parseInt(item.value) || 0;
        total += preco * quantidade;
    });
    totalElement.textContent = total.toFixed(2).replace('.', ',');
    totalHiddenInput.value = total.toFixed(2);
}

inputs.forEach(input => {
    input.addEventListener('input', atualizarTotal);
});

const formulario = document.getElementById('carrinho');
formulario.addEventListener('submit', (e) => {
    const total = parseFloat(totalHiddenInput.value) || 0;

    if (total <= 0) {
        e.preventDefault();
        alert('Você precisa selecionar pelo menos um produto para finalizar a compra!');
    }
});