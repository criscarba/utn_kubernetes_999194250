from flask import Flask, jsonify
import mysql.connector
import os

app = Flask(__name__)

def query_table(table_name):
    mydb = mysql.connector.connect(
        host = os.getenv("MYSQL_DB_HOST"),
        user = os.getenv("MYSQL_DB_USER"),
        password = os.getenv("MYSQL_ROOT_PASSWORD"),
        database = os.getenv("MYSQL_DATABASE")
    )
    
    mycursor = mydb.cursor()
    mycursor.execute(f"SELECT * FROM {table_name}")

    # Fetch all rows and convert to a list of dictionaries
    columns = [desc[0] for desc in mycursor.description]
    results = [dict(zip(columns, row)) for row in mycursor.fetchall()]

    mycursor.close()
    mydb.close()
    return results

@app.route('/')
def hello():
    try:
        return jsonify("Welcome to the WebApp! For querying a Table please include the WebApp URL + '/query/<table_name>'")
    except mysql.connector.Error as err:
        return jsonify({'error': str(err)}), 500

@app.route('/query/<table_name>')
def query_endpoint(table_name):
    try:
        data = query_table(table_name)
        return jsonify(data)
    except mysql.connector.Error as err:
        return jsonify({'error': str(err)}), 500

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)  # Use 0.0.0.0 to allow external access