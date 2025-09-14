# Dawarich Home Assistant Add-on

Dodatek Supervisor Home Assistant dla aplikacji Dawarich (self-hosted location history app).

## Instalacja
1. Skopiuj katalog `dawarich/` do `/addons/local/dawarich` lub dodaj repozytorium GitHub w Supervisorze
2. W Home Assistant przejdź do **Supervisor → Add-on store → Local add-ons**, wybierz *Dawarich* i kliknij *Install*
3. Skonfiguruj opcje w GUI (np. `SECRET_KEY_BASE`)
4. Uruchom dodatek. Interfejs otworzy się wewnątrz GUI Home Assistant dzięki **Ingress**.
5. (Opcjonalnie) Możesz też korzystać z portu 3000 pod adresem `http://homeassistant.local:3000`
