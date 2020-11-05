# title: Resident behavior pattern recognition model (KICT)
# version: 0.5
# created: 2020.7.25
# revised: 2020.11.3
#
from math import acos
from math import sqrt
from math import pi, atan2
import numpy as np
from numpy import pi, rad2deg, arctan2
import subprocess
import os
from subprocess import Popen, PIPE
import codecs, json
from json import JSONEncoder

# math function
def angle(p1, p2):
    dx = p2[0] - p1[0]
    dy = (p2[1] - p1[1]) * -1.0
    ang1 = atan2(dy, dx)
    return rad2deg((ang1) % (2 * pi))


def length(v):
    return sqrt(v[0] ** 2 + v[1] ** 2)


def dot_product(v, w):
    return v[0] * w[0] + v[1] * w[1]


def determinant(v, w):
    return v[0] * w[1] - v[1] * w[0]


def inner_angle(v, w):
    cosx = dot_product(v, w) / (length(v) * length(w))
    rad = acos(cosx)  # in radians
    return rad * 180 / pi  # returns degrees


def angle_clockwise(A, B):
    inner = inner_angle(A, B)
    det = determinant(A, B)
    if det < 0:  # this is a property of the det. If the det < 0 then B is clockwise of A
        return inner
    else:  # if the det > 0 then A is immediately clockwise of B
        return 360 - inner


def is_angle_in_margin(angle1, angle2, margin=20):
    a1 = angle2 - margin
    a2 = angle2 + margin
    if a1 < 0:
        a1 = a1 + 360
        a2 = a2 + 360
        angle1 = angle1 + 360

    if angle1 >= a1 and angle1 <= a2:
        return True
    return False

# image
def readImage():
    return


class NumpyArrayEncoder(JSONEncoder):
    """ Special json encoder for numpy types """
    def default(self, obj):
        if isinstance(obj, (np.int_, np.intc, np.intp, np.int8,
            np.int16, np.int32, np.int64, np.uint8,
            np.uint16, np.uint32, np.uint64)):
            return int(obj)
        elif isinstance(obj, (np.float_, np.float16, np.float32, 
            np.float64)):
            return float(obj)
        elif isinstance(obj,(np.ndarray,)): #### This is the fix
            return obj.tolist()
        return json.JSONEncoder.default(self, obj)


# pattern
class OpenPose:
    Nose = 0
    Neck = 1
    RShoulder = 2
    RElbow = 3
    RWrist = 4
    LShoulder = 5
    LElbow = 6
    LWrist = 7
    MidHip = 8
    RHip = 9
    RKnee = 10
    RAnkle = 11
    LHip = 12
    LKnee = 13
    LAnkle = 14
    REye = 15
    LEye = 16
    REar = 17
    LEar = 18
    LBigToe = 19
    LSmallToe = 20
    LHeel = 21
    RBigToe = 22
    RSmallToe = 23
    RHeel = 24
    Background = 25

    skeleton = []
    skeleton_names = []

    def parsing(self, folder):
        fileno = 0
        filenames = os.listdir(folder)
        for filename in filenames:
            if filename.find('.json') > 0:
                fullname = folder + filename
                fileno = fileno + 1

        maxPeople = 20
        self.skeleton = np.arange(fileno * maxPeople * 25 * 3, dtype='f').reshape(fileno * maxPeople, 25, 3)

        peopleIndex = 0
        filenames = os.listdir(folder)
        for filename in filenames:
            if filename.find('.json') > 0:
                fullname = folder + filename

                with open(fullname, 'r', encoding='utf-8') as json_file:
                    data = json.load(json_file)

                    people = data["people"]
                    for p in people:
                        pose = p["pose_keypoints_2d"]

                        for j, key in enumerate(pose):
                            i = int(j / 3)
                            self.skeleton[peopleIndex][i][j % 3] = float(key)

                        peopleIndex = peopleIndex + 1
                        self.skeleton_names.append(filename)

        # self.dump()    
        return 

    def dump(self):
        print(self.skeleton)
        return

    def process(self, imageFile):
        try:
            subprocess.call('.\\bin\\openposedemo --image_dir .\\input\\ --write_images .\\output\\ --write_json .\\output\\ --display 0', shell=True)
            # out = subprocess.check_output('.\\bin\\openposedemo', shell=True)
        except EnvironmentError:
            return

        self.parsing('.\\output\\')
        return

    def skeletonization(self, imageFile):
        self.process(imageFile)
        return self.skeleton, self.skeleton_names


class pattern:
    peopleCount = 0

    none = 0
    stand = 1
    sit = 2
    sleep = 3

    def normalize(self, s):
        return s

    def count(self):
        return self.peopleCount

    def isEmpty(self, v):
        return False

    def writePosition(self, data, outputFile):
        data2 = data['people']
        json.dump(list(data2), 
            codecs.open(outputFile, 'w', encoding='utf-8'), 
            cls=NumpyArrayEncoder, 
            separators=(',', ':'), sort_keys=True, indent=4)
        return

    def getPosition(self, pos):
        ret = 'none'
        if pos == self.none:
            ret = 'none'
        elif pos == self.stand:
            ret = 'stand'
        elif pos == self.sit:
            ret = 'sit'
        elif pos == self.sleep:
            ret = 'sleep'
        return ret

    def predictPosition(self, s):
        nose = s[OpenPose.Nose]
        # print('nose = ', nose)
        neck = s[OpenPose.Neck]
        midhip = s[OpenPose.MidHip]

        ls = s[OpenPose.LShoulder]
        lw = s[OpenPose.LWrist]
        rs = s[OpenPose.RShoulder]
        rw = s[OpenPose.RWrist]

        lh = s[OpenPose.LHip]
        lk = s[OpenPose.LKnee]        
        la = s[OpenPose.LAnkle]
        rh = s[OpenPose.RHip]
        rk = s[OpenPose.RKnee]
        ra = s[OpenPose.RAnkle]

        if p.isEmpty(nose) or p.isEmpty(neck):
            return self.none

        angleNN = angle(nose, neck)
        angleNH = angle(neck, midhip)
        # print('neck = ', neck)
        # print('midhip = ', midhip)     
        # print('angle NN = ', angleNN)                   
        # print('angle NH = ', angleNH)

        pos = self.none
        if (self.isEmpty(lh) and self.isEmpty(la)) or (self.isEmpty(rh) and self.isEmpty(ra)):
            pos = self.sit
        else:
            angleLHA = angle(lh, lk)
            angleRHA = angle(rh, rk)
            # print('angle LHA = ', angleLHA)
            # print('angle RHA = ', angleRHA)

            # angle = clockwise direction. cartesian coordinates in math.
            if is_angle_in_margin(angleNN, 0) or is_angle_in_margin(angleNH, 0):
                pos = self.sleep
            elif is_angle_in_margin(angleNN, 180) or is_angle_in_margin(angleNH, 180):
                pos = self.sleep
            elif is_angle_in_margin(angleNN, 360) or is_angle_in_margin(angleNH, 360):
                pos = self.sleep                
            elif is_angle_in_margin(angleLHA, 90) or is_angle_in_margin(angleRHA, 90):
                pos = self.stand
            elif is_angle_in_margin(angleLHA, 270) or is_angle_in_margin(angleRHA, 270):
                pos = self.stand
            elif is_angle_in_margin(angleLHA, 0, 50) or is_angle_in_margin(angleRHA, 0, 50):
                pos = self.sit
            elif is_angle_in_margin(angleLHA, 180, 50) or is_angle_in_margin(angleRHA, 180, 50):
                pos = self.sit
        
        print("position: ", self.getPosition(pos))
        return pos


# input image
inputImage = readImage()

# predict skeleton using deep learning
op = OpenPose()
s, f = op.skeletonization(inputImage)

# normalize
p = pattern()
s = p.normalize(s)

# calculate pattern
data = {}
data['people'] = []

for i, people in enumerate(s):
    if i >= len(f):
        break
    print("no: ", i)
    print("name: ", f[i])
    print("neck point: ", people[OpenPose.Neck])        
    pos = p.predictPosition(people)
    data['people'].append({"no": i, "name": f[i], 
        "neck point": people[OpenPose.Neck], 
        "position": p.getPosition(pos)})

p.writePosition(data, ".\\RRM_output.json")
