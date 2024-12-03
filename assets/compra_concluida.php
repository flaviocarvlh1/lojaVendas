<?php
session_start();
include_once 'config.php'; 

if (isset($_POST['nome'], $_POST['data_nascimento'], $_POST['morada'])) {
    $nome_cliente = $_POST['nome'];
    $data_nascimento = $_POST['data_nascimento'];
    $morada = $_POST['morada'];

    $produtos_resumo = $_SESSION['produtos_resumo'] ?? [];
    $quantidade_total = $_SESSION['quantidade_total'] ?? 0;
    $preco_total = $_SESSION['preco_total'] ?? 0;

    if (empty($produtos_resumo) || $quantidade_total == 0 || $preco_total == 0) {
        die("Erro: Nenhum produto válido encontrado.");
    }

    $data_encomenda = date('Y-m-d H:i:s');
    $query_encomenda = "INSERT INTO encomendas (nome_cliente, data_nascimento, morada, data_encomenda, quantidade_total, preco_total, produtos) 
    VALUES (?, ?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($query_encomenda);
$produtos_serializados = json_encode($produtos_resumo); 
$stmt->bind_param("ssssdis", $nome_cliente, $data_nascimento, $morada, $data_encomenda, $quantidade_total, $preco_total, $produtos_serializados);
    $stmt->execute();
    $encomenda_id = $stmt->insert_id; 
    $stmt->close();

    $query_detalhes = "INSERT INTO detalhes_encomenda (encomenda_id, produto_nome, quantidade, preco_unitario) 
                       VALUES (?, ?, ?, ?)";
    $stmt_detalhes = $conn->prepare($query_detalhes);

    foreach ($produtos_resumo as $produto_detalhe) {
        
        preg_match('/^(.*?) \(x(\d+)\)$/', $produto_detalhe, $matches);
        $produto_nome = $matches[1];
        $quantidade = (int) $matches[2];
        
        $query_preco = "SELECT preco FROM produtos WHERE nome = ?";
        $stmt_preco = $conn->prepare($query_preco);
        $stmt_preco->bind_param("s", $produto_nome);
        $stmt_preco->execute();
        $stmt_preco->bind_result($preco_unitario);
        $stmt_preco->fetch();
        $stmt_preco->close();

        $stmt_detalhes->bind_param("isid", $encomenda_id, $produto_nome, $quantidade, $preco_unitario);
        $stmt_detalhes->execute();
    }

    $stmt_detalhes->close();


    if (isset($nome_cliente) && isset($produtos_resumo) && isset($quantidade_total) && isset($preco_total) && isset($morada)) {
        echo "
        <div class='compra-container'>
            <h1>Compra realizada com sucesso!</h1>
            <p class='mensagem-boas-vindas'>Obrigado por sua compra, <strong class='nome-cliente'>$nome_cliente</strong>.</p>
            <p class='resumo-encomenda'>Resumo da encomenda:</p>
            <ul class='lista-produtos'>";
            
            foreach ($produtos_resumo as $produto_detalhe) {
                echo "<li class='produto-item'>$produto_detalhe</li>";
            }
    
        echo "
            </ul>
            <p class='total-itens'><strong>Total de itens:</strong> $quantidade_total</p>
            <p class='preco-total'><strong>Preço total:</strong> R$ " . number_format($preco_total, 2, ',', '.') . "</p>
            <p class='morada'>Data de entrega será enviada para: <strong class='destino'>$morada</strong>.</p>
            <a href='index.php' class='botao-voltar'>Voltar à Página Inicial</a>
        </div>
        ";
    } else {
        die("Erro: Dados do cliente não enviados.");
    }
}    

?>
<link rel="stylesheet" href="./css/compra_concluida.css">
