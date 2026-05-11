import { useDispatch, useSelector } from "react-redux";
import "./style.css"; // Isso garante que o seu design bonitão volte!

function App() {
  const dispatch = useDispatch();
  const cart = useSelector((state) => state.cart);

  const products = [
    { id: 1, name: "Mouse Gamer", price: 120 },
    { id: 2, name: "Teclado Mecânico", price: 250 },
    { id: 3, name: "Headset", price: 180 },
  ];

  function addToCart(product) {
    dispatch({
      type: "ADD_TO_CART",
      payload: product,
    });
  }

  function removeFromCart(index) {
    dispatch({
      type: "REMOVE_FROM_CART",
      payload: index,
    });
  }

  return (
    <div className="container">
      <h1>TechGear</h1>
      <h2>Carrinho de Compras com Redux</h2>

      <section>
        <h3>Produtos Disponíveis</h3>
        <div className="product-list">
          {products.map((product) => (
            <div className="card" key={product.id}>
              <span>{product.name} - R$ {product.price}</span>
              <button onClick={() => addToCart(product)}>Adicionar ao Carrinho</button>
            </div>
          ))}
        </div>
      </section>

      <hr />

      <section>
        <h3>Seu Carrinho ({cart.length} itens)</h3>
        {cart.length === 0 ? (
          <p>O carrinho está vazio.</p>
        ) : (
          cart.map((item, index) => (
            <div className="card" key={index} style={{ borderLeft: '5px solid #222' }}>
              <span>{item.name} - R$ {item.price}</span>
              <button onClick={() => removeFromCart(index)} style={{ background: '#d9534f' }}>
                Remover
              </button>
            </div>
          ))
        )}
      </section>
    </div>
  );
}

export default App;