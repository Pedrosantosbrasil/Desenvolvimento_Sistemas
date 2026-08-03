interface PedidoStrategy {
fun processar(pedido: Pedido)
}

class NovoPedidoStrategy : PedidoStrategy {
override fun processar(pedido: Pedido) {
println("Pedido em processamento: ${pedido.id}")
// Simulação de processamento (evitando Thread.sleep)
}
}

class PedidoProcessadoStrategy : PedidoStrategy {
override fun processar(pedido: Pedido) {
println("Pedido já processado: ${pedido.id}")
}
}

class PedidoDesconhecidoStrategy : PedidoStrategy {
override fun processar(pedido: Pedido) {
println("Status desconhecido do pedido: ${pedido.id}")
}
}

class PedidoProcessor {

fun processarPedido(pedido: Pedido) {
val strategy = when (pedido.status) {
"novo" -> NovoPedidoStrategy()
"processado" -> PedidoProcessadoStrategy()
else -> PedidoDesconhecidoStrategy()
}

strategy.processar(pedido)
}
}