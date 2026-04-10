Semana 04 - Aula 03

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Consulta de Usuários</title>
</head>
<link rel="stylesheet" href="style.css">

<body>

  <h1>Consulta de Usuários</h1>
  <ul id="user-list"></ul>
  <div id="user-details"></div>
<!-- Acima tem o Titulo (H1), (div) é o container do codigo e (url) -->
  <script src="script.js"></script>

</body>

</html>
script.js
async function fetchUsers() {
  try {
    const response = await fetch("https://jsonplaceholder.typicode.com/users");
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    const users = await response.json();
    displayUsers(users);
  } catch (error) {
    console.error("Erro ao buscar usuários:", error);
  }
}
// inicialmente eu uma função que faz uma ligação com uma api, ela esta insirida na estrurura try cacht, ela permite fazer o tratamento de erros no codigo
function displayUsers(users) {
  const userList = document.getElementById("user-list");
  userList.innerHTML = ""; // Limpa a lista existente

  users.forEach((user) => {
    const listItem = document.createElement("li");
    listItem.textContent = user.name;
    listItem.onclick = () => showUserDetails(user);
    userList.appendChild(listItem);
  });
  // Acresenta informaçoes na div, capturando o ID e cria 05 a sub-itens, sendo eles, nome, email, endereço e site
}

fetchUsers(); // Chama a função ao carregar a página

function showUserDetails(user) {
  const userDetails = document.getElementById("user-details");
  userDetails.innerHTML = `
        <h2>${user.name}</h2>
        <p>Email: ${user.email}</p>
        <p>Phone: ${user.phone}</p>
        <p>Website: <a href="http://${user.website}" target="_blank">${user.website}</a></p>
        <p>Address: ${user.address.street}, ${user.address.city}</p>
    `;
}

// Essa função pega o Id da div, com as informacoes da api ela pega 5 tags do html (h2) e cria 04 paragrafos