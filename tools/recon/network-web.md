# Recon — Network & Web

| Tool | What it's for | Quick command |
|---|---|---|
| **[nmap](https://nmap.org/)** | Always step one. Full TCP sweep, then targeted version/script scan. | `nmap -p- --min-rate 5000 -oN tcp-all <ip>` then `nmap -sCV -p<ports> -oN tcp-detail <ip>` |
| **[feroxbuster](https://github.com/epi052/feroxbuster)** | Recursive content discovery on web apps — faster default for "what directories/files exist" than gobuster when you want recursion out of the box. | `feroxbuster -u http://<ip> -w /usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt` |
| **[ffuf](https://github.com/ffuf/ffuf)** | Fast, flexible fuzzer — directories, vhosts, parameters, anything where you control the `FUZZ` position. | `ffuf -u http://<ip>/FUZZ -w wordlist.txt -fc 404` |
| **[gobuster](https://github.com/OJ/gobuster)** | Same niche as ffuf/ferox — also does DNS subdomain brute-forcing and vhost discovery in one tool. | `gobuster vhost -u http://<ip> -w subdomains.txt` |
| **[whatweb](https://github.com/urbanadventurer/WhatWeb)** | Fingerprints the web stack (CMS, framework, server version) — run before guessing at exploits. | `whatweb http://<ip>` |
| **[nikto](https://github.com/sullo/nikto)** | Quick web server misconfig/vuln scan — outdated software, dangerous files, default creds. Noisy, but a fast first pass. | `nikto -h http://<ip>` |
