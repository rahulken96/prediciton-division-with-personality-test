# file project
from connections import app, request, Response, jsonify

# library
import math
import numpy as np
import pandas as pd
from sqlalchemy import create_engine
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score
from sklearn import metrics

# ambil data dari db
host = "localhost"
database = "mbti_v1"
username = "root"
password = ""
mydb = create_engine(f"mysql+mysqlconnector://{username}:{password}@{host}/{database}")

@app.route('/', methods=['GET'])
def index():
    return 'Terhubung dengan Venv Flask di Laravel. YEAYYY!! ^_^'

@app.route('/ls', methods=['POST'])
def postData():
  cont = request.json
  data = dict()
  data['nama'] = cont['name']
  data['divisi'] = cont['role']
  return jsonify(data)

@app.route('/proses/knn', methods=['POST'])
def prosesKNN():
    """ Get Data """
    req = request.json

    """ Proses KNN """
    query = "SELECT * FROM reports"
    dt = pd.read_sql(query, mydb)

    """ Mengatasi nilai 0 """
    not_zero = ['I', 'E', 'N', 'S', 'T', 'F', 'J', 'P',]

    for kolom in not_zero:
        dt[kolom] = dt[kolom].replace(0, np.NaN)
        mean = int(dt[kolom].mean(skipna=True))
        dt[kolom] = dt[kolom].replace(np.NaN, mean)

    """ split dataset """
    X = dt.iloc[:, 4:12].values
    Y = dt.iloc[:, 12].values
    X_train, X_test, Y_train, Y_test = train_test_split(X, Y, random_state=0)

    """ feature scaling """
    sc_X = StandardScaler()
    X_train = sc_X.fit_transform(X_train)
    X_test = sc_X.transform(X_test)

    """ menentukan nilai K dengan cara mengambil nilai *Ganjil* akar dari total kesulurahn data Y_test """
    k = math.sqrt(len(Y_test))
    if round(k) % 2 == 0:
        k = round(k) - 1
    else:
        k = round(k)

    """ Fit model KNN Tanpa Tuning"""
    knn = KNeighborsClassifier(n_neighbors=k, metric='euclidean')
    knn.fit(X_train, Y_train)

    """ Grid Search """
    k_range = list(range(1, len(Y_train)+1))
    param_grid = dict(n_neighbors=k_range)

    grid = GridSearchCV(knn, param_grid, scoring='accuracy')
    grid.fit(X_train, Y_train)

    """ Grid Search best params & akurasi """
    optValue = grid.best_params_
    gsACC = grid.best_score_ *100

    """ Fit model KNN setelah Tuning """
    k_optimal = optValue['n_neighbors']
    knn_grid = KNeighborsClassifier(n_neighbors=k_optimal, metric='euclidean')
    knn_grid.fit(X, Y)

    """ Prediksi terhadap data test dataset """
    Y_pred = knn_grid.predict(X_test)

    """ Evaluasi Model """
    cm = metrics.confusion_matrix(Y_test, Y_pred)

    """ Cek keakuratan model terhadap data tes """
    knnACC = accuracy_score(Y_test, Y_pred) * 100

    # ---------------------------------------------------------------------------------

    """ Inisiasi data test request / real data """
    I = req['I']
    E = req['E']
    N = req['N']
    S = req['S']
    T = req['T']
    F = req['F']
    J = req['J']
    P = req['P']

    """ sebelum reshape """
    X_new = np.array([P, I, J, T, E, N, S ,F])

    """ sesudah reshape """
    X_new = X_new.reshape(1, -1)

    """ Hasil prediksi dari data tes """
    X_pred_new = knn_grid.predict(X_new)

    if(len(X_pred_new) == 1):
        response = jsonify({
            'knnACC' : f'{knnACC}',
            'gsACC' : f'{gsACC}',
            'optVal' : f'{optValue}',
            'knnPREDICITON' : f'{X_pred_new[0]}',
            'status': 200,
        })
    else:
        response = jsonify({
            'hasil' : 'Data Tidak Ditemukan !',
            'status': 400,
        })

    return response


if __name__ == "__main__":
    app.run(port=8005)
