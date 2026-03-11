---
name: helm-updates-k8s
description: Busca actualizaciones disponibles para todos los Helm charts instalados en el clúster de Kubernetes. Úsala cuando el usuario pregunte por updates de Helm releases.
---

# Skill para verificar actualizaciones de Helm Charts en Kubernetes

## Cuándo usarla
- Cuando el usuario mencione "actualizaciones Helm", "updates charts", "helm upgrade disponible" o similar.
- Proporciona un script bash listo para ejecutar que liste releases con versiones actualizadas.

## Pasos a seguir
1. **Verifica contexto K8s**: Asegúrate de que `kubectl config current-context` apunte al clúster correcto.
2. **Lista releases instaladas**: Usa `helm list -A` para obtener todas las releases en todos los namespaces.
3. **Para cada release**, extrae:
   - Nombre (columna 1)
   - Chart (columna 5, ej: "bitnami/nginx-15.0.1")
   - Versión app (columna 7)
4. **Busca la última versión**: Usa `helm search repo CHART_REPO/CHART_NAME --versions | head -n 3` para obtener la más reciente.
5. **Compara versiones**: Si la versión latest > versión instalada, marca como "Actualizable".
6. **Ejecuta o genera el script**: Proporciona el siguiente script bash completo. Explícale al usuario cómo usarlo.

