from flask import Flask, request
import firebase_admin
from firebase_admin import db
import json
from collections import defaultdict

cred_obj = firebase_admin.credentials.Certificate('./ServiceAccountKey.json')
default_app = firebase_admin.initialize_app(cred_obj, {
	'databaseURL':"https://patienthospital-2967f-default-rtdb.firebaseio.com"
	})


app = Flask(__name__)

def addUsers():
    ref = db.reference("/login")
    with open("users.json", "r") as f:
        file_contents = json.load(f)
    for key, value in file_contents.items():
        ref.push().set(value)

def addHospitals():
    ref = db.reference("/hospitals")
    with open("hospitals.json", "r") as f:
        file_contents = json.load(f)
    for key, value in file_contents.items():
        ref.push().set(value)
        
def addAppointment():
    ref = db.reference("/appointment")
    with open("appointment.json", "r") as f:
        file_contents = json.load(f)
    for key, value in file_contents.items():
        ref.push().set(value)
        
def read_user_collection_byid(userid):
    userdeets = []
    print("collecting user details for id:", userid)
    ref = db.reference('/login')
    snapshot = ref.order_by_key().get()
    for _, val in snapshot.items():
        y = json.dumps(val)
        z = json.loads(y)
        if z["userId"] == userid:
            userdeets.append({"userName":z["userName"],"role":z["role"],"userEmail":z["userEmail"]})
            #print("role:", z["role"], " userId: ",z["userId"])
            return userdeets
    return 0
    
    
    
def read_hospital_collection_byid(hospitalid):
    hospdeets = []
    print("collecting hospital details for id:", hospitalid)
    ref = db.reference('/hospitals')
    snapshot = ref.order_by_key().get()
    for _, val in snapshot.items():
        y = json.dumps(val)
        z = json.loads(y)
        if z["hostipalId"] == hospitalid:
            hospdeets.append({"hostipalName":z["hostipalName"]})
            #print("role:", z["role"], " userId: ",z["userId"])
            return hospdeets
    return 0
    
    
def read_user_collection_byname(userEmail):
    print("collecting user details for name:", userEmail)
    ref = db.reference('/login')
    snapshot = ref.order_by_key().get()
    for _, val in snapshot.items():
        y = json.dumps(val)
        z = json.loads(y)
        if z["userEmail"] == userEmail:
            #print("role:", z["role"], " userId: ",z["userId"])
            return z["userId"]
    return 0

def read_appointment_collection(userEmail):
    f = 0
    appdeets = []
    
    patientId = read_user_collection_byname(userEmail)
    
    if patientId != 0:
        
        ref = db.reference('/appointment')    
        snapshot = ref.order_by_key().get()
        for _, val in snapshot.items():
            y = json.dumps(val)
            z = json.loads(y)
            if z["patientId"] == patientId:                
                appdeets.append({"hospital":read_hospital_collection_byid(z["hostipalId"]),"AppointmentDescription":z["AppointmentDescription"],"doctor":read_user_collection_byid(z["doctorId"]),"dateTime":z["dateTime"]})              
        if (len(appdeets) == 0):
            print("no patient found")
    appdeets.append({"patient":read_user_collection_byid(patientId)})        
    return json.dumps(appdeets)      
    
@app.route('/login', methods=['GET'])
def post_route():
    if request.method == 'GET':        
        userEmail = request.args.get('userEmail')
        
        appdeets = read_appointment_collection(userEmail)
        
        return json.dumps(json.loads(appdeets))

app.run(host="10.84.14.200")
