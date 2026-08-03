const express = require('express');
const https = require('https');
const fs = require('fs');
const jwt = require('jsonwebtoken');
const winston = require('winston');

const app = express();
app.use(express.json());

// Passo 4: Configuração de logs com Winston
const logger = winston.createLogger({
    level: 'info',
    format: winston.format.combine(
        winston.format.timestamp(),
        winston.format.json()
    ),
    transports: [
        new winston.transports.File({ filename: 'pedidos-audit.log' }),
        new winston.transports.Console()
    ]
});

app.use((req, res, next) => {
    logger.info(`Acesso ao serviço de pedidos: ${req.method} ${req.url} - IP: ${req.ip}`);
    next();
});

const SECRET_KEY = 'secretKey';

// Passo 3: Middleware de Autenticação (Validação do Token)
const verificarToken = (req, res, next) => {
    const token = req.headers['authorization'];
    if (!token) {
        logger.warn('Acesso negado: Token ausente');
        return res.status(403).send('Token é necessário');
    }

    jwt.verify(token.replace('Bearer ', ''), SECRET_KEY, (err, decoded) => {
        if (err) {
            logger.error('Acesso negado: Falha ao autenticar o token');
            return res.status(500).send('Falha ao autenticar o token');
        }
        req.user = decoded; // Armazena id e role no request
        next();
    });
};

// Passo 3: Middleware de Autorização (Roles)
const apenasAdmins = (req, res, next) => {
    if (req.user.role !== 'administrador') {
        logger.warn(`Acesso negado: Usuário ID ${req.user.id} sem permissão de administrador`);
        return res.status(403).send('Acesso negado: Requer privilégios de administrador');
    }
    next();
};

// Rotas Protegidas
app.get('/pedidos', verificarToken, (req, res) => {
    res.json({ mensagem: 'Lista de pedidos do cliente', userId: req.user.id });
});

app.delete('/pedidos/:id', verificarToken, apenasAdmins, (req, res) => {
    logger.info(`Pedido ${req.params.id} excluído pelo admin ID ${req.user.id}`);
    res.json({ mensagem: 'Pedido excluído com sucesso (Apenas Admin)' });
});

// Passo 2: Configuração de HTTPS
const options = {
    key: fs.readFileSync('server-key.pem'),
    cert: fs.readFileSync('server-cert.pem')
};

https.createServer(options, app).listen(3001, () => {
    console.log('Serviço de Gestão de Pedidos rodando em HTTPS na porta 3001');
});