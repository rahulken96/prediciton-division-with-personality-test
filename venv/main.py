# file project
from connections import app, request, Response, jsonify

# library
import math
import numpy as np
import pandas as pd
from sqlalchemy import create_engine
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score, f1_score
from sklearn import metrics

# ambil data dari db
host = "localhost"
database = "mbti_v1"
username = "root"
password = ""
mydb = create_engine(f"mysql+mysqlconnector://{username}:{password}@{host}/{database}")

def dd(self):
    return jsonify(f"{self}")

@app.route('/', methods=['GET'])
def index():
  return 'Halaman index dari venv dalam laravel YEAYYY !! ^_^'


""" Dapetin Data """
@app.route('/post', methods=['POST'])
def postData():
  cont = request.json
  data = dict()
  data['nama'] = cont['name']
  data['divisi'] = cont['role']
  return jsonify(data)

""" Proses KNN """
@app.route('/get', methods=['GET'])
def knn():
    
    """ query data """
    query = "SELECT * FROM reports"
    dt = pd.read_sql(query, mydb)

    q = "SELECT * FROM reports ORDER BY id DESC LIMIT 10"
    last = pd.read_sql(q, mydb)

    """ Mengatasi nilai 0 """
    not_zero = ['I', 'E', 'N', 'S', 'T', 'F', 'J', 'P',]

    for kolom in not_zero:
        dt[kolom] = dt[kolom].replace(0, np.NaN)
        mean = int(dt[kolom].mean(skipna=True))
        dt[kolom] = dt[kolom].replace(np.NaN, mean)

    """ split dataset """
    X_train = dt.iloc[:, 4:12]
    Y_train = dt.iloc[:, 12]
    return Response(f"{Y_train} {'<br>'}", mimetype='text/plain')

    """ feature scaling """
    sc_X = StandardScaler()
    X_train = sc_X.fit_transform(X_train)
    X_test = sc_X.transform(X_test)

    """ menentukan nilai K dengan cara mengambil nilai "Ganjil" akar dari total kesulurahn data Y_test """
    if round(k) % 2 == 0:
        k = round(k) - 1
    else:
        k = round(k)

    """ Fit model """
    classifier = KNeighborsClassifier(n_neighbors=k, p=2, metric='euclidean')
    classifier.fit(X_train, Y_train)

    """ Hasil prediksi dari data tes """
    Y_pred = classifier.predict(X_test)
    return jsonify(f"{Y_pred}")

    """ Evaluasi Model """
    evalModel = metrics.confusion_matrix(Y_test, Y_pred)

    """ Cek keakuratan model terhadap data tes """
    acc = accuracy_score(Y_test, Y_pred) * 100

if __name__ == "__main__":
    app.run()
