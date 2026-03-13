---
name: redactar-informe
description: Redacta un informe sobre el estado del clúster de kubernetes
---

# Skill para redactar un informe sobre el estado del clúster de kubernetes

## Cuándo usarla
- Cuando el usuario mencione "redactar informe clúster kubernetes", "crear informe clúster kubenetes", "generar informe clúser kubernetes" o similar.

## Pasos a seguir
1. **Verifica contexto K8s**: Asegúrate de que `kubectl config current-context` apunte al clúster correcto.
2. **Obten un listado de namespaces**: Usa kubectl para obtener una lista con todos los namespaces.
3. **Obtener eventos de cada namespace**: Obten los eventos de cada uno de los namespaces y quédate solamente con los 3 más críticos.
4. **Obten un listado de todos los Pods en estado error**: Obten un listado de todos los Pods de todos los namespaces y muestra en el informe solamente aquellos que estén en estado de error. Investiga por qué están en estado de error y añadelo al informe.
5. **Revisa el estado de los nodos**: obten un listado de nodos y busca aquellos cuyo estado no sea Ready. Muestra en el informe la causa por la que no están en estado Ready.

