import json
import zipfile
import os
appi_token = {"username":"fiorella698","key":"9866430e99171b5625aa9997fd0b1fe8"} ## contenido de archivo kaggle.json
##conectar a kaggle
with open ("C:/Users/fiore/kaggle.json","w") as file:
    json.dump(appi_token,file)

location = "C:/Users/fiore/OneDrive/Escritorio/Proyecto_parcial/dataset"

##validar existencia de carpeta
if not os.path.exists(location):
    ## si no existe la carpeta
    os.mkdir(location)
else:
    ## si existe procedo a borrar su contenido
    for root, dirs, file in os.walk(location, topdown=False):
        for name in file:
            os.remove(os.path.join(root,name)) ##elimino toda las carpetas
        for name in dirs:
            os.rmdir(os.path.join(root,name)) ##elimino toda las carpetas

##descargar dataset
os.system("kaggle datasets download -d henryshan/starbucks -p C:/Users/fiore/OneDrive/Escritorio/Proyecto_parcial/dataset")
##descomprimir el archivo
os.chdir(location)
for file in os.listdir():
    zip_ref = zipfile.ZipFile(file,"r") ##leer archivo .zip
    zip_ref.extractall() ##extraer contenido archivo .zip
    zip_ref.close() ##cierra el archivo
    

