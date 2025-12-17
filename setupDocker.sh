#!/usr/bin/env bash
######################################
#
# Install Docker on debian  
#
# (c) 2025 cndrbrbr
#####################################
# chmod u+x setup_docker.sh
#

set -euo pipefail


# Install Docker Engine + Docker Compose plugin on Debian 12 (bookworm)

if [[ $EUID -ne 0 ]]; then
  echo "Bitte als root ausführen (oder mit sudo)."
  exit 1
fi

echo "[1/7] Voraussetzungen installieren…"
apt-get update
apt-get install -y ca-certificates curl gnupg

echo "[2/7] Docker GPG-Key installieren…"
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo "[3/7] Docker APT-Repo hinzufügen…"
ARCH="$(dpkg --print-architecture)"
CODENAME="$(. /etc/os-release && echo "$VERSION_CODENAME")"
echo \
  "deb [arch=${ARCH} signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian ${CODENAME} stable" \
  > /etc/apt/sources.list.d/docker.list

echo "[4/7] Docker installieren…"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "[5/7] Docker Dienst aktivieren & starten…"
systemctl enable --now docker

echo "[6/7] Optional: aktuellen SUDO_USER zur docker-Gruppe hinzufügen…"
if [[ -n "${SUDO_USER:-}" && "${SUDO_USER}" != "root" ]]; then
  usermod -aG docker "$SUDO_USER"
  echo "User '$SUDO_USER' wurde zur Gruppe 'docker' hinzugefügt."
  echo "Wichtig: Einmal ab- und wieder anmelden (oder 'newgrp docker')."
else
  echo "Kein SUDO_USER erkannt (oder root) – überspringe Gruppen-Setup."
fi

echo "[7/7] Installation prüfen…"
docker --version
docker compose version
docker run --rm hello-world || true

echo "Fertig."
