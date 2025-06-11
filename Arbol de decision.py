import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.tree import DecisionTreeClassifier, plot_tree
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
from sklearn.preprocessing import StandardScaler
from google.colab import files

print("Por favor, sube tu archivo CSV con los datos del vino.")
uploaded = files.upload()

try:
    file_name = list(uploaded.keys())[0]
    print(f"\nArchivo subido exitosamente: {file_name}")
    df = pd.read_csv(file_name)
except Exception as e:
    print(f"Error al cargar el archivo: {e}")
    print("Asegúrate de subir un archivo CSV válido.")
    print("Intentando cargar un dataset de ejemplo 'winequality-red.csv' desde una URL...")
    try:
        url = "https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv"
        df = pd.read_csv(url, sep=';')
        print("Dataset de ejemplo cargado exitosamente.")
    except Exception as e_url:
        print(f"No se pudo cargar el dataset de ejemplo: {e_url}")
        raise

print("\n--- 1. Exploración Inicial de Datos ---")
print("\nPrimeras 5 filas del dataset:")
print(df.head())

print("\nInformación del DataFrame:")
df.info()

print("\nEstadísticas Descriptivas:")
print(df.describe())

print("\nValores Nulos por columna:")
print(df.isnull().sum())

if 'quality' not in df.columns:
    print("\nError: La columna 'quality' (variable objetivo) no se encuentra en el DataFrame.")
    print(f"Columnas disponibles: {df.columns.tolist()}")
    raise KeyError("Columna 'quality' no encontrada. Verifica el nombre en tu archivo CSV.")

print("\nDistribución de la Calidad del Vino (variable objetivo):")
quality_counts = df['quality'].value_counts().sort_index()
print(quality_counts)
plt.figure(figsize=(8, 5))
sns.countplot(x='quality', data=df, palette='viridis')
plt.title('Distribución de la Calidad del Vino')
plt.xlabel('Calidad')
plt.ylabel('Frecuencia')
plt.show()

if len(quality_counts) < 2:
    print("\nAdvertencia: La variable objetivo 'quality' tiene menos de 2 clases únicas. Se necesita al menos 2 para clasificación.")

print("\n--- 2. Visualización Detallada de Datos ---")
features = df.drop('quality', axis=1).columns

print("\nHistogramas de las características:")
df.hist(bins=20, figsize=(15, 10), layout=(4, (len(features) // 4) + 1), grid=False)
plt.tight_layout()
plt.show()

print("\nDiagramas de Caja (Boxplots) de Características vs Calidad:")
for feature in features:
    plt.figure(figsize=(10, 4))
    sns.boxplot(x='quality', y=feature, data=df, palette='coolwarm')
    plt.title(f'{feature} vs Calidad del Vino')
    plt.show()

print("\nMatriz de Correlación:")
plt.figure(figsize=(12, 10))
correlation_matrix = df.corr()
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', fmt=".2f", linewidths=.5)
plt.title('Matriz de Correlación de Características del Vino')
plt.show()

X = df.drop('quality', axis=1)
y = df['quality']

print("\n--- 4. Entrenamiento del Modelo de Árbol de Decisión ---")

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=42, stratify=y if len(y.unique()) > 1 else None)

print(f"Forma de X_train: {X_train.shape}, X_test: {X_test.shape}")
print(f"Forma de y_train: {y_train.shape}, y_test: {y_test.shape}")

dt_classifier = DecisionTreeClassifier(random_state=42, max_depth=5, min_samples_split=20, min_samples_leaf=10)

dt_classifier.fit(X_train, y_train)
print("Modelo de Árbol de Decisión entrenado.")

print("\n--- 5. Evaluación del Modelo ---")
y_pred = dt_classifier.predict(X_test)

accuracy = accuracy_score(y_test, y_pred)
print(f"\nPrecisión (Accuracy) del modelo: {accuracy:.4f} ({(accuracy*100):.2f}%)")

print("\nMatriz de Confusión:")
cm = confusion_matrix(y_test, y_pred, labels=sorted(y.unique()))
print(cm)
plt.figure(figsize=(8, 6))
sns.heatmap(cm, annot=True, fmt='d', cmap='Blues',
            xticklabels=sorted(y.unique()), yticklabels=sorted(y.unique()))
plt.xlabel('Calidad Predicha')
plt.ylabel('Calidad Real')
plt.title('Matriz de Confusión')
plt.show()

print("\nReporte de Clasificación:")
try:
    target_names_report = [str(q) for q in sorted(y.unique())]
    print(classification_report(y_test, y_pred, target_names=target_names_report, zero_division=0))
except ValueError as ve:
    print(f"Advertencia al generar reporte de clasificación: {ve}")
    print("Generando reporte sin target_names explícitos si es necesario.")
    print(classification_report(y_test, y_pred, zero_division=0))

print("\n--- 6. Interpretación del Modelo ---")

print("\nImportancia de las Características:")
importances = dt_classifier.feature_importances_
feature_importance_df = pd.DataFrame({'Feature': X.columns, 'Importance': importances})
feature_importance_df = feature_importance_df.sort_values(by='Importance', ascending=False)
print(feature_importance_df)

plt.figure(figsize=(10, 6))
sns.barplot(x='Importance', y='Feature', data=feature_importance_df, palette='rocket')
plt.title('Importancia de las Características en el Árbol de Decisión')
plt.show()

print("\nVisualización del Árbol de Decisión (puede ser grande):")
plt.figure(figsize=(25, 15))
plot_tree(dt_classifier,
          filled=True,
          rounded=True,
          class_names=[str(q) for q in sorted(y.unique())],
          feature_names=X.columns.tolist(),
          fontsize=8,
          max_depth=3)
plt.title("Visualización del Árbol de Decisión (Primeros Niveles)", fontsize=20)
plt.show()
print("Nota: Si el árbol es muy profundo, la visualización completa puede ser ilegible.")
print("Se ha limitado la profundidad de la visualización a 3 niveles para mayor claridad.")
print("Puedes ajustar 'max_depth' en plot_tree para ver más o menos niveles, o eliminarlo para ver el árbol completo.")

print("\n--- Análisis Completado ---")