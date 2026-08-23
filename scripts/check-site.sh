#!/bin/sh
# Verifies the live site end to end. Run after a deploy.
#   ./scripts/check-site.sh [host]     (default: jesse-day.com)
host="${1:-jesse-day.com}"

echo "== HTTP -> HTTPS (expect 1 redirect, no loop) =="
for h in "$host" "www.$host"; do
  curl -s -o /dev/null -w "  http://$h  redirects: %{num_redirects}  final: %{url_effective}  status: %{http_code}\n" \
    -L --max-redirs 10 --max-time 25 "http://$h"
done

echo "== HSTS =="
curl -sI --max-time 25 "https://$host" | grep -i strict-transport | sed 's/^/  /' || echo "  (none)"

echo "== Assets =="
for f in "" style.css hero.jpg og.jpg; do
  printf "  /%-10s %s\n" "$f" "$(curl -s -o /dev/null -w '%{http_code}' --max-time 25 "https://$host/$f")"
done

echo "== Repo docs must NOT be served (expect 404) =="
for f in CLAUDE.md README.md PLAN.md wrangler.jsonc package.json; do
  printf "  /%-16s %s\n" "$f" "$(curl -s -o /dev/null -w '%{http_code}' --max-time 25 "https://$host/$f")"
done

echo "== Certificate =="
echo | openssl s_client -connect "$host:443" -servername "$host" 2>/dev/null \
  | openssl x509 -noout -issuer -dates 2>/dev/null | sed 's/^/  /'
