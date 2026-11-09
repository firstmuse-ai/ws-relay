#!/bin/sh
set -e
: "${UUID:?UUID env required}"
: "${WS_PATH:?WS_PATH env required}"
PORT="${PORT:-8080}"
sed -e "s|__UUID__|${UUID}|g" -e "s|__WS_PATH__|${WS_PATH}|g" -e "s|__PORT__|${PORT}|g" /usr/local/etc/xray/config.json.template > /usr/local/etc/xray/config.json
exec xray run -config /usr/local/etc/xray/config.json
