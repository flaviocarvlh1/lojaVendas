<?php
include_once 'config.php';

$query = "SELECT id, nome, preco, quantidade FROM produtos";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    $produtos = $result->fetch_all(MYSQLI_ASSOC);
} else {
    $produtos = [];
}
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/index.css">
    <title>Loja de Bebidas</title>
    
</head>
<body>
    <div class="header"></div>
    <?php include 'header.php'; ?>

   
    <h2>Produtos Disponíveis</h2>
    <form id="carrinho" method="POST" action="finalizar_compra.php">
    <div class="produtos-container">
    <?php foreach ($produtos as $produto): ?>
        <div class="produto" id="produto-<?php echo $produto['id']; ?>">
            <img src="images/<?php echo strtolower(str_replace(' ', '', $produto['nome'])); ?>.jpg" alt="<?php echo $produto['nome']; ?>">
            <div>
                <h3><?php echo $produto['nome']; ?></h3>
                <p>Preço: € <?php echo number_format($produto['preco'], 2, ',', '.'); ?></p>
                <p>Quantidade Disponível: <span id="quantidade-<?php echo $produto['id']; ?>"><?php echo $produto['quantidade']; ?></span></p>
                <label>Quantidade:</label>
                <input 
                    type="number" 
                    name="quantidades[<?php echo $produto['id']; ?>]" 
                    min="0" 
                    max="<?php echo $produto['quantidade']; ?>" 
                    value="0" 
                    class="quantidade" 
                    data-preco="<?php echo $produto['preco']; ?>"
                    id="input-<?php echo $produto['id']; ?>">
                <span class="indisponivel" id="indisponivel-<?php echo $produto['id']; ?>" style="display: <?php echo $produto['quantidade'] == 0 ? 'block' : 'none'; ?>;">Produto Esgotado</span>
            </div>
        </div>
    <?php endforeach; ?>
</div>

    <div class="total-container">
        <div class="total">
            <strong>Total: € <span id="total">0.00</span></strong>
        </div>

        <input type="hidden" id="total_hidden" name="total"> 
        <button type="submit" class="btn">Concluir Compra</button>
    </div>
    </form>

    

    <script src="./javascript/index.js"></script>

    <?php include 'footer.php'; ?>
</body>
</html>
