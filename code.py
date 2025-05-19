import getpass
from mysql.connector import MySQLConnection, Error
from tabulate import tabulate

cnx = MySQLConnection(
    user='root',                  
    password='1234',              
    host='127.0.0.1',             
    port=3307,                    
    database='emr'                
)

cursor = cnx.cursor()

currentUser = None

def call_stored_procedure(procedureName, args=[]):
    cursor.callproc(procedureName, args)
    resultSet = []
    for result in cursor.stored_results():
        columns = [col[0] for col in result.description]
        resultSet = result.fetchall()
    return [resultSet, columns]

def verify_dentist_login(email, password):
    global currentUser
    try:
        emailId = email
        pwd = password
        result = call_stored_procedure("dentistLogin",[email, password])
        if(len(result)):
            currentUser = result[0]
            return True
        else:
            return False
    except Error as e:
        print(e)

def verify_patient_login(email, password):
    global currentUser
    try:
        emailId = email
        pwd = password
        result = call_stored_procedure("patientLogin",[email, password])
        if(len(result)):
            currentUser = result[0]
            return True
        else:
            return False
    except Error as e:
        print(e)

def dentist_login():
    email = input("Email: ")
    password = getpass.getpass("Password: ")
    if verify_dentist_login(email, password):
        print("Login successful!\n")
        return True
    else:
        print("Invalid email or password.")
        return False

def patient_login():
    email = input("Email: ")
    password = getpass.getpass("Password: ")
    if verify_patient_login(email, password):
        print("Login successful!\n")
        return True
    else:
        print("Invalid email or password.")
        return False

def printTable(arr):
    records  = arr[0]
    columns = arr[1]
    print("\n")
    print(tabulate(records, columns))
    print("\n")

def main_menu():
    print("Select from the following options:")
    print("1. Enter Dentist Portal")
    print("2. Enter Patient Portal")
    print("3. Exit Application")

def dentist_menu():
    print("Dentist Portal:")
    print("1. Browse All Scheduled Appointments")
    print("2. Check My Upcoming Appointments")
    print("3. Access Patient Database")
    print("4. Review My Patient Visits")
    print("5. Sign Out")

def patient_menu():
    print("Patient Portal:")
    print("1. Check My Upcoming Appointments")
    print("2. Review My Prescription History")
    print("3. Find a Dentist")
    print("4. Sign Out")

def view_all_appointments():
    printTable(call_stored_procedure("viewAllAppointments"))

def view_dentist_appointments():
    if currentUser is not None and len(currentUser) > 0:
        printTable(call_stored_procedure("viewAppointmentsOfDentist", [currentUser[0][0]]))
    else:
        print("No user logged in or user information is incomplete.")


def view_patient_appointments():
    if currentUser is not None:
        printTable(call_stored_procedure("viewAppointmentsOfPatient", [currentUser[0][0]]))
    else:
        print("Please log in first.")

def view_all_patients():
    printTable(call_stored_procedure("viewAllPatients"))

def view_all_doctors():
    printTable(call_stored_procedure("viewAllDentists"))

def view_patient_prescriptions():
    if currentUser is not None:
        printTable(call_stored_procedure("viewPrescriptionOfPatient", [currentUser[0][0]]))
    else:
        print("Please log in first.")

def view_my_patients():
    if currentUser is not None:
        printTable(call_stored_procedure("viewPatientsOfDentist", [currentUser[0][0]]))
    else:
        print("Please log in first.")

def view_billing():
    # retrieve and display billing information for logged in user
    pass

# main program flow
while True:
    main_menu()
    choice = input("Option: ")
    if choice == "1":
        if dentist_login():
            while True:
                dentist_menu()
                option = input("Option: ")
                if option == "1":
                    view_all_appointments()
                elif option == "2":
                    view_dentist_appointments()
                elif option == "3":
                    view_all_patients()
                elif option == "4":
                    view_my_patients()
                elif option == "5":
                    print("Logging out.")
                    break
                else:
                    print("Invalid option.")
    elif choice == "2":
        if patient_login():
            while True:
                patient_menu()
                option = input("Option: ")
                if option == "1":
                    view_patient_appointments()
                elif option == "2":
                    view_patient_prescriptions()
                elif option == "3":
                    view_all_doctors()
                elif option == "4":
                    print("Logging out.")
                    break
                else:
                    print("Invalid option.")
    elif choice == "3":
        print("Exiting...")
        break
    else:
        print("Invalid choice")

cursor.close()
cnx.close()
