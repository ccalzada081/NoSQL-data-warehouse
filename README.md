# NoSQL-data-warehouse

## 📌 Descripción del Proyecto 

Este proyecto integra modelos relacionales y de grafos para construir un sistema de **recomendación de productos** a partir de datos de entrada y salida. Se transforma una base de datos transaccional en un modelo de nodos con **Neo4j**, permitiendo analizar relaciones complejas entre artículos.

Las recomendaciones se generan usando **consultas Cypher** y se exportan como archivos CSV. Posteriormente, se realiza una transformación inversa, integrando los resultados nuevamente en un **modelo dimensional relacional**, dentro de un esquema de inteligencia de negocios (BI).

### 🔧 Herramientas y Tecnologías
- Neo4j y Cypher
- KNIME (extracción a CSV)
- SQL Server (modelo dimensional y tablas de hechos)
- Modelado híbrido (relacional + grafos)

### 📈 Resultados
- Sistema funcional de recomendaciones por co-ocurrencia de productos en folios.
- Consultas optimizadas con procesamiento por bloques (`SKIP/LIMIT`).
- Reintegración de resultados al modelo relacional para uso analítico en BI.

### 🎯 Objetivo
Explorar el uso combinado de bases de datos de grafos y relacionales para enriquecer el análisis de datos y generar recomendaciones útiles en contexto de almacenes de datos.

---

## 📌 Project Overview 

This project combines relational and graph models to build a **product recommendation system** based on transactional data. A relational database is transformed into a **graph model using Neo4j**, allowing complex relationship analysis between items.

Recommendations are generated with **Cypher queries**, exported as CSV, and reintegrated into a **dimensional relational model**, forming part of a BI-ready schema.

### 🔧 Tools and Technologies
- Neo4j and Cypher
- KNIME (CSV export)
- SQL Server (dimensional model and fact tables)
- Hybrid data modelling

### 📈 Results
- Functional co-occurrence recommendation system.
- Optimised graph queries using block processing (`SKIP/LIMIT`).
- Reintegration into relational BI schema for reporting and analytics.

### 🎯 Objective
To demonstrate how combining graph and relational models can enhance data analysis and enable meaningful recommendations within data warehouse environments.
