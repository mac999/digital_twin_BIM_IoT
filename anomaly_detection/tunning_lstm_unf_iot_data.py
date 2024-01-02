# title: tunning UNF iot dataset using LSTM model
# author: Taewook Kang
# date: 2021.10.1
# license: MIT
# version
#   0.1. 2021.10.1. first release.
#   0.2. 2022.8.6. update 
#   0.3. 2023.5.29. revise
import math, argparse
import numpy as np
import matplotlib.pyplot as plt
import tensorflow as tf
import datetime
from pandas import read_csv
import tensorflow as tf
import keras
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import LSTM
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics import mean_squared_error

# fix random seed for reproducibility
np.random.seed(7)

def MAPE(y_test, pred):
    try:
        y_test = y_test + 0.001
        mape = np.mean(np.abs((y_test - pred) / y_test))
        return mape
    except Exception as e:
        pass
    return 0.0

def get_statistics(trainY, trainPredict):
    max, min = np.max(trainY), np.min(trainY)
    mape = MAPE(trainY, trainPredict)
    rmse = math.sqrt(mean_squared_error(trainY, trainPredict))
    nrmse = rmse / (max - min)
    return max, min, mape, rmse, nrmse

# convert an array of values into a dataset matrix
def create_dataset(dataset, look_back=1):
    dataX, dataY = [], []
    for i in range(len(dataset)-look_back-1):
        a = dataset[i:(i+look_back), 0]
        dataX.append(a)
        dataY.append(dataset[i + look_back, 0])
    return np.array(dataX), np.array(dataY)

def prepare_model(neurons = 4, look_back = 1):
    # create and fit the LSTM network
    model = Sequential()
    model.add(LSTM(neurons, input_shape=(1, look_back)))
    model.add(Dense(1))
    model.compile(loss='mean_squared_error', optimizer='adam')
    return model

def train_predict(data_fname, epoch_num):
    print(f'\n*data set = {data_fname}')
    # load the dataset
    # dataframe = read_csv('dream_center_energy.csv', usecols=[1], engine='python', skipfooter=3)
    # dataframe = read_csv('unf_iot_light_summary_10s.csv', usecols=[2], engine='python', skipfooter=3)
    # dataframe = read_csv('unf_iot_light_full_summary_10s.csv', usecols=[2], engine='python', skipfooter=3)
    dataframe = read_csv(data_fname, usecols=[2], engine='python', skipfooter=3)
    dataset = dataframe.values
    dataset = dataset.astype('float32')

    # normalize the dataset
    scaler = MinMaxScaler(feature_range=(0, 1))
    dataset = scaler.fit_transform(dataset)

    # split into train and test sets
    train_size = int(len(dataset) * 0.6)
    test_size = len(dataset) - train_size
    train, test = dataset[0:train_size,:], dataset[train_size:len(dataset),:]

    # reshape into X=t and Y=t+1
    look_back = 1
    trainX, trainY = create_dataset(train, look_back)
    testX, testY = create_dataset(test, look_back)

    # reshape input to be [samples, time steps, features]
    trainX = np.reshape(trainX, (trainX.shape[0], 1, trainX.shape[1]))
    testX = np.reshape(testX, (testX.shape[0], 1, testX.shape[1]))

    log_dir = "logs/fit/" + datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
    tensorboard_callback = tf.keras.callbacks.TensorBoard(log_dir=log_dir, histogram_freq=1)

    model = prepare_model(4, look_back)
    model.summary()
    model.fit(trainX, trainY, epochs=epoch_num, batch_size=1, verbose=2, callbacks=[tensorboard_callback])  # verbose: 'auto', 0, 1, or 2. Verbosity mode. 0 = silent, 1 = progress bar, 2 = one line per epoch. 

    date_name = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
    model_fname = 'models/' + date_name
    print(f'model name = {model_fname}')
    model.save(model_fname)

    # make predictions
    model = keras.models.load_model(model_fname)
    trainPredict = model.predict(trainX)
    testPredict = model.predict(testX)

    # invert predictions
    trainPredict = scaler.inverse_transform(trainPredict)
    trainY = scaler.inverse_transform([trainY])
    testPredict = scaler.inverse_transform(testPredict)
    testY = scaler.inverse_transform([testY])

    # calculate root mean squared error
    max, min, mape, rmse, nrmse = get_statistics(trainY[0], trainPredict[:,0])
    print(f'Train set. min={min:.2f}, max={max:.2f}, mape={mape:.2f}, rmse={rmse:.2f}, nrmse={nrmse:.2f}, ')

    max, min, mape, rmse, nrmse = get_statistics(testY[0], testPredict[:,0])
    print(f'Test set. min={min:.2f}, max={max:.2f}, mape={mape:.2f}, rmse={rmse:.2f}, nrmse={nrmse:.2f}, ')

    # shift train predictions for plotting
    trainPredictPlot = np.empty_like(dataset)
    trainPredictPlot[:, :] = np.nan
    trainPredictPlot[look_back:len(trainPredict)+look_back, :] = trainPredict

    # shift test predictions for plotting
    testPredictPlot = np.empty_like(dataset)
    testPredictPlot[:, :] = np.nan
    testPredictPlot[len(trainPredict)+(look_back*2)+1:len(dataset)-1, :] = testPredict

    # plot baseline and predictions
    plt.clf()
    plt.plot(scaler.inverse_transform(dataset), color='green')
    plt.plot(trainPredictPlot, color='blue')
    plt.plot(testPredictPlot, color='red')
    plt.savefig(data_fname + date_name + '.png')

parser = argparse.ArgumentParser()
parser.add_argument('--input', default='./unf_iot_temp_full_summary_10s.csv', help='input dataset')
args = parser.parse_args()

train_predict(args.input, 150)
# train_predict('unf_iot_humi_full_summary_10s.csv', 150)
# train_predict('unf_iot_light_full_summary_10s.csv', 150)

input()
