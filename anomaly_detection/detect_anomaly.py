# title: detect anomaly data pattern
# author: Taewook Kang
# date: 2021.10.1
# license: MIT
# version
#   0.1. 2021.10.1. first release.
#   0.2. 2022.8.6. update 
#   0.3. 2023.5.29. revise
import numpy as np
import math, argparse
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

# convert an array of values into a dataset matrix
def create_dataset(dataset, look_back=1):
	dataX, dataY = [], []
	for i in range(len(dataset)-look_back-1):
		a = dataset[i:(i+look_back), 0]
		dataX.append(a)
		dataY.append(dataset[i + look_back, 0])
	return np.array(dataX), np.array(dataY)

def plot_dataset(title, dataset, normal_pattern_range):
	plt.style.use('ggplot')
	plt.figure(figsize=(15,5))

	plt.title(title, fontsize=20)
	plt.xlabel('time', fontsize=15)
	plt.ylabel('temperature (STD)', fontsize=15)
	plt.xticks(fontsize=10)
	plt.yticks(fontsize=10)
	plt.plot(np.arange(len(dataset)), dataset, color='b')
	plt.ylim(0, 1.2)
	x = np.arange(normal_pattern_range, normal_pattern_range)
	y1 = [0]*len(x)
	y2 = [1.2]*len(x)
	plt.fill_between(x, y1, y2, facecolor='g', alpha=.3)
	plt.show()

def plot_train_test_dataset(scaler, dataset, look_back, train_predict, test_predict):
	train_predict_plot = np.empty_like(dataset)
	train_predict_plot[:, :] = np.nan
	train_predict_plot[look_back:len(train_predict)+look_back, :] = train_predict

	test_predict_plot = np.empty_like(dataset)
	test_predict_plot[:, :] = np.nan
	test_predict_plot[len(train_predict)+(look_back*2)+1:len(dataset)-1, :] = test_predict

	plt.title('data prediction results')
	plt.xlabel('time')
	plt.ylabel('temperature (°C)')
	plt.plot(scaler.inverse_transform(dataset), color='green')
	plt.plot(scaler.inverse_transform(train_predict_plot), color='blue')
	plt.plot(scaler.inverse_transform(test_predict_plot), color='red')
	plt.show()

def plot_anomaly_detection(dataset, m_dist):  
	fig, axes = plt.subplots(nrows=2, figsize=(15,10))

	axes[0].plot(dataset,color='b',label='original data')
	axes[0].set_xlabel('time')
	axes[0].set_ylabel('ECG\'s value' )
	axes[0].set_ylim(-3, 3)
	x = np.arange(1300,1300)
	y1 = [-3]*len(x)
	y2 = [3]*len(x)
	axes[0].fill_between(x, y1, y2, facecolor='g', alpha=.3)

	axes[1].plot(m_dist, color='r',label='Mahalanobis Distance')
	axes[1].set_xlabel('time')
	axes[1].set_ylabel('Mahalanobis Distance')
	axes[1].set_ylim(0, 1000)
	y1 = [0] * len(x)
	y2 = [1000] * len(x)
	axes[1].fill_between(x, y1, y2, facecolor='g', alpha=.3)

	plt.xlabel('time')
	plt.ylabel('energy consumption (kWh)')
	plt.legend(fontsize=15)
	plt.show()

def Mahala_distantce(x, mean, cov):
	d = 0
	try:
		d = np.dot(x - mean, np.linalg.inv(cov))
		d = np.dot(d, (x - mean).T)
	except Exception as e:
		print(e)
	return d

def diff_stat(A, B):
	N = len(A)

	error_diff = np.abs(A - B)
	error_mean = np.mean(np.abs(A - B))
	dev_error = error_diff - error_mean

	return dev_error, error_mean

	
def mahalanobis_distance(ds_train_test, ds_train_test_predict, look_back):
	# calculate Mahalanobis dtraniistance
	errors = ds_train_test - ds_train_test_predict   # normal pattern
	mean = sum(errors) / len(errors)
	cov = 0
	for e in errors:
		cov += np.dot((e - mean).reshape(len(e), 1), (e - mean).reshape(1, len(e)))
	cov /= len(errors)
	print('mean : ', mean)
	print('cov : ', cov)

	# anomaly detection
	testX = testX.squeeze(1)
	testX = testX.squeeze(1)
	test_predict = test_predict.squeeze(1)
	errors = testX - test_predict   

	m_dist = [0]*look_back 
	for e in errors:
		dist = Mahala_distantce(e, mean, cov)
		m_dist.append(dist)

	plot_anomaly_detection(ds_train_test, m_dist) 


def find_anomalies_by_std(data, sigma):
	#define a list to accumlate anomalies
	anomalies = []
	
	# Set upper and lower limit to 3 standard deviation
	random_data_std = np.std(data)
	random_data_mean = np.mean(data)
	anomaly_cut_off = random_data_std * sigma # 3
	
	lower_limit  = random_data_mean - anomaly_cut_off 
	upper_limit = random_data_mean + anomaly_cut_off
	print(lower_limit)
	# Generate outliers
	for index, outlier in enumerate(data):
		if outlier > upper_limit or outlier < lower_limit:
			value = outlier.squeeze(0)
			value = float(value)
			anomalies.append([index, value])
	return np.array(anomalies)

def plot_anomaly_pattern(title, scaler, dataset, predict_dataset, anomalies):
	print(f'{title} dataset n={len(dataset)}, anomalies n={len(anomalies)}.')

	origin_dataset = scaler.inverse_transform(dataset)
	ano = scaler.inverse_transform([anomalies[:, 1]])
	anomalies[:, 1] = ano[0]

	predict_dataset = scaler.inverse_transform(predict_dataset)

	plt.title(title)
	plt.xlabel('time')
	plt.ylabel('temperature (°C)')
	plt.plot(origin_dataset, color='green')
	plt.plot(predict_dataset, color='blue')
	plt.scatter(anomalies[:, 0], anomalies[:, 1], color='red')

	xmin, xmax, y1, y2 = plt.axis()
	for ano in anomalies:
		x = ano[0]
		plt.fill_between([x-10, x+10], y1, y2, facecolor='orange', alpha=.05)

	plt.ylim(y1, y2)
	plt.show()

def predict_data(model, dataset):
	# fix random seed for reproducibility
	np.random.seed(7)

	dataset = dataset.astype('float32')

	# normalize the dataset
	scaler = MinMaxScaler(feature_range=(0, 1))
	dataset = scaler.fit_transform(dataset)

	# split into train and test sets
	train_size = int(len(dataset) * 0.6)
	normal_pattern_range = train_size

	test_size = len(dataset) - train_size
	train, test = dataset[0:train_size,:], dataset[train_size:len(dataset),:]
	plot_dataset('normalization', dataset, normal_pattern_range)

	# reshape into X=t and Y=t+1
	look_back = 1
	trainX, trainY = create_dataset(train, look_back)
	testX, testY = create_dataset(test, look_back)

	# reshape input to be [samples, time steps, features]
	trainX = np.reshape(trainX, (trainX.shape[0], 1, trainX.shape[1]))
	testX = np.reshape(testX, (testX.shape[0], 1, testX.shape[1]))

	log_dir = "logs/predict/" + datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
	tensorboard_callback = tf.keras.callbacks.TensorBoard(log_dir=log_dir, histogram_freq=1)

	# predict
	train_predict = model.predict(trainX)
	test_predict = model.predict(testX)
	ds_train_test = np.append(trainX, testX)
	ds_train_test_predict = np.append(train_predict, test_predict)

	# calculate root mean squared error
	def print_root_mean_square_error(title, x, y):
		x1 = scaler.inverse_transform(x)
		y1 = scaler.inverse_transform(y)        
		score = math.sqrt(mean_squared_error(x1, y1))
		print(f'{title} dataset(n={len(x)}) score: {score:.3f} RMSE')

	print_root_mean_square_error('Train', trainY.reshape(-1,1), train_predict)
	print_root_mean_square_error('Test', testY.reshape(-1,1), test_predict)
	plot_train_test_dataset(scaler, dataset, look_back, train_predict, test_predict)

	# anomaly detection
	anomalies_train = find_anomalies_by_std(train_predict, sigma=2.0)   # train
	plot_anomaly_pattern('anomaly detection (train set)', scaler, trainX.reshape(-1, 1), train_predict, anomalies_train)

	anomalies_test = find_anomalies_by_std(test_predict, sigma=2.0)     # test
	plot_anomaly_pattern('anomaly detection (test set)', scaler, testX.reshape(-1, 1), test_predict, anomalies_test)

	ds_error = ds_train_test_predict - ds_train_test                    # error
	anomalies_error = find_anomalies_by_std(ds_error, sigma=3.0)        
	anomalies_error[:,1] = ds_train_test_predict[anomalies_error[:,0].astype(int)]
	plot_anomaly_pattern('anomaly detection (error set)', scaler, ds_train_test.reshape(-1, 1), ds_train_test_predict.reshape(-1, 1), anomalies_error)

	# mahalanobis_distance(ds_train_test, ds_train_test_predict, look_back)
	input()

def main():
	# load the LSTM network
	parser = argparse.ArgumentParser()
	parser.add_argument('--model', default='./models/20221219-234531', help='trained model')
	parser.add_argument('--input', default='./unf_iot_temp_full_summary_10s.csv', help='input dataset')
	args = parser.parse_args()

	try:
		# model_fname = './models/20221219-234531'    # train/test. 0.67
		# model_fname = './models/20230529-113850'    # train/test. 0.60
		model_fname = args.model
		model = keras.models.load_model(model_fname)

		# load the dataset
		# dataframe = read_csv('dream_center_energy.csv', usecols=[1], engine='python', skipfooter=3)
		# dataframe = read_csv('unf_iot_light_summary_10s.csv', usecols=[2], engine='python', skipfooter=3)
		# dataframe = read_csv('unf_iot_temp_full_summary_10s.csv', usecols=[2], engine='python', skipfooter=3)
		dataframe = read_csv(args.input, usecols=[2], engine='python', skipfooter=3)
		dataset = dataframe.values

		predict_data(model, dataset)
	except Exception as e:
		print(e)

if __name__ == "__main__":
	main()
