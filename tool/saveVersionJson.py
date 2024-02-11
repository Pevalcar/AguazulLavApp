# Importa el módulo pyyaml
import yaml
import json 

# Abre el archivo YAML en modo lectura
with open("pubspec.yaml", "r") as file:
  # Lee el contenido del archivo y lo convierte en un diccionario Python
  data = yaml.load(file, Loader = yaml.FullLoader)

version = data.get("version")

# Imprime el diccionario


jsonm = {
    "android": {
        "latest": version,
        "url":{
            "arm64-v8a":  f"https://github.com/Pevalcar/AguazulLavApp/releases/download/v{version}/app-arm64-v8a-release.apk",
            "x86_64": f"https://github.com/Pevalcar/AguazulLavApp/releases/download/v{version}/app-x86_64-release.apk",
            "armeabi-v7a": f"https://github.com/Pevalcar/AguazulLavApp/releases/download/v{version}/app-armeabi-v7a-release.apk"
        }
    },
    "ios": {
        "latest": version,
        "url":""
    },
    "windows": {
        "latest": version,
        "url":""
    }
}

with open("versions.json", "w") as file:
  # Escribe el diccionario en el archivo JSON
  json.dump(jsonm, file, indent=4)
  # Cierra el archivo
  file.close()

print("version json creado ")

