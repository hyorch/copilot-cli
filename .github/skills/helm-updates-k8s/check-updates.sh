#!/bin/bash
# check-helm-updates.sh - Verifica updates para todos los Helm releases

echo "🔍 Verificando actualizaciones de Helm charts en el clúster..."
helm list -A --output yaml | yq '.items[] | select(.status == "deployed") | {name: .metadata.name, namespace: .metadata.namespace, chart: .chart.metadata.version // .chart, app_version: .chart.appVersion // "N/A"}' > releases.json

while IFS=$'\t' read -r name ns rev updated status chart app_version; do
  if [[ "$status" != "deployed" ]]; then continue; fi
  chart_name=$(echo "$chart" | cut -d/ -f1)
  chart_repo=$(echo "$chart" | cut -d/ -f2- | sed 's/-[0-9].*//')
  
  echo "📦 $name ($ns): $chart ($app_version)"
  latest=$(helm search repo "$chart_name" --versions -o table | tail -n +2 | sort -V | tail -n1 | awk '{print $1}')
  if [[ "$latest" > "$app_version" || "$latest" > "$(echo $chart | cut -d- -f2-)" ]]; then
    echo "   ✅ UPDATE DISPONIBLE: $latest"
  else
    echo "   ➡️  Al día"
  fi
  echo "---"
done < <(helm list -A | tail -n +2)

rm -f releases.json
echo "✅ Verificación completada."