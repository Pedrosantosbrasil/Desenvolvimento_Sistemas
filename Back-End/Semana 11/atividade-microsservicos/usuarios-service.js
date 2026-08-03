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
        new winston.transports.File({ filename: 'usuarios-audit.log' }),
        new winston.transports.Console()
    ]
});

// Middleware para registrar todas as requisições (Auditoria)
app.use((req, res, next) => {
    logger.info(`Requisição recebida: ${req.method} ${req.url} - IP: ${req.ip}`);
    next();
});

const SECRET_KEY = 'secretKey';

// Passo 3: Rota de login gerando JWT com roles
app.post('/login', (req, res) => {
    const { username, password } = req.body;

    // Simulação de banco de dados e verificação de roles
    if (username === 'admin' && password === '1234') {
        const token = jwt.sign({ id: 1, role: 'administrador' }, SECRET_KEY, { expiresIn: '1h' });
        logger.info(`Login com sucesso para usuário: ${username}`);
        return res.json({ token });
    } else if (username === 'cliente' && password === '1234') {
        const token = jwt.sign({ id: 2, role: 'cliente' }, SECRET_KEY, { expiresIn: '1h' });
        logger.info(`Login com sucesso para usuário: ${username}`);
        return res.json({ token });
    }

    logger.warn(`Tentativa de login falhou para: ${username}`);
    res.status(401).send('Credenciais inválidas');
});

// Passo 2: Configuração de HTTPS
const options = {
    key: fs.readFileSync('server-key.pem'),
    cert: fs.readFileSync('server-cert.pem')
};

https.createServer(options, app).listen(3000, () => {
    console.log('Serviço de Gestão de Usuários rodando em HTTPS na porta 3000');
});