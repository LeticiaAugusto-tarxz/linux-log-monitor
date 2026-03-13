# Linux Log Watchdog 🛡️👁️

Este projeto é um sistema de monitoramento de segurança em tempo real, desenvolvido em Bash, focado na detecção de ataques de força bruta (Brute Force) e tentativas de acesso não autorizado via SSH.

## 🚀 Funcionalidades Técnicas
- **Análise em Tempo Real:** Utiliza o fluxo de dados do sistema (`tail -F`) para monitorar o arquivo `/var/log/auth.log` sem causar impacto na performance do servidor.
- **Detecção de Intrusão:** Identifica padrões de falha de autenticação ("Failed password") instantaneamente.
- **Inteligência de Dados:** Emprega Expressões Regulares (Regex) para extrair o endereço IP de origem do atacante.
- **Registro Forense:** Gera um log de auditoria isolado (`ssh_alerts.log`) para análise posterior de incidentes e bloqueios de segurança.

## 🛠️ Como Funciona
O script atua como um "sentinela". Ao detectar múltiplas falhas de um mesmo IP, ele alerta o administrador no terminal e registra o evento. Esta é a base para ferramentas mais complexas de defesa, como o *Fail2Ban*.

## 📖 Instruções de Uso
1. Clone este repositório:
   `git clone https://github.com/LeticiaAugusto-tarxz/linux-log-monitor.git`
2. Garanta permissão de execução:
   `chmod +x monitor_ssh.sh`
3. Execute com privilégios de superusuário (necessário para ler arquivos de log do sistema):
   `sudo ./monitor_ssh.sh`

## 🧠 Mentalidade de Segurança
A capacidade de observar logs é a primeira linha de defesa de um SysAdmin. Este projeto demonstra proatividade e domínio das ferramentas nativas do Linux para garantir a integridade do perímetro.
