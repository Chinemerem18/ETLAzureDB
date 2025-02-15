#import relevant libraries
import requests
import pandas as pd

# API endpoints
products_url = "https://dummyjson.com/products"
carts_url = "https://dummyjson.com/carts"
users_url = "https://dummyjson.com/users"

# extract products
response_products = requests.get(products_url)
products = response_products.json().get('products', []) if response_products.status_code == 200 else []

# extract carts
response_carts = requests.get(carts_url)
carts = response_carts.json().get('carts', []) if response_carts.status_code == 200 else []

# extract users
response_users = requests.get(users_url)
users = response_users.json().get('users', []) if response_users.status_code == 200 else []

# convert to pandas dataframes
products_df = pd.DataFrame(products)
carts_df = pd.DataFrame(carts)
users_df = pd.DataFrame(users)

#review dataframe info
print("Products:", products_df.info())
print("Carts:", carts_df.info())
print("Users:", users_df.info())

# preview data
print("Products:", products_df.head())
print("Carts:", carts_df.head())
print("Users:", users_df.head())

#transform data
#drop duplicates on PK columns
products_df.drop_duplicates(subset=['id'], inplace=True)
users_df.drop_duplicates(subset=['id'], inplace=True)
carts_df.drop_duplicates(subset=['id'], inplace=True)

#check for null values
print(products_df.isnull().any())
print(users_df.isnull().any())
print(carts_df.isnull().any())

#replace null values
products_df['brand'] = products_df['brand'].fillna('Unknown')

#flatten carts dataframe to create cart products dataframe
cart_items = []
for cart in carts:
    for product in cart['products']:
        cart_items.append({
            'cart_id': cart['id'],
            'user_id': cart['userId'],
            'product_id': product['id'],
            'quantity': product['quantity'],
            'total': product['quantity'] * product['price']
        })

cart_items_df = pd.DataFrame(cart_items)
print(cart_items_df.info())


import json
# function to prepare users data (handles json fields)
def prepare_users_data(users_df):
    users_df = users_df.copy()

    # convert nested json columns into json strings
    users_df["hair"] = users_df["hair"].apply(json.dumps)
    users_df["bank"] = users_df["bank"].apply(json.dumps)
    users_df["company"] = users_df["company"].apply(json.dumps)
    users_df["address"] = users_df["address"].apply(json.dumps)
    users_df["crypto"] = users_df["crypto"].apply(json.dumps) # keeping json format

    return users_df


# function to prepare products data
def prepare_products_data(products_df):
    products_df = products_df.copy()

    # convert lists to json string
    products_df["tags"] = products_df["tags"].apply(json.dumps)
    products_df["dimensions"] = products_df["dimensions"].apply(json.dumps)
    products_df["meta"] = products_df["meta"].apply(json.dumps)
    products_df["reviews"] = products_df["reviews"].apply(json.dumps)
    products_df["images"] = products_df["images"].apply(json.dumps)

    return products_df


def prepare_carts_data(carts_df):

    # convert products column into a json string
    carts_df["products"] = carts_df["products"].apply(json.dumps)

    return carts_df

# prepare data
users_df = prepare_users_data(users_df)
products_df = prepare_products_data(products_df)
carts_df = prepare_carts_data(carts_df)
cart_items_df = cart_items_df[cart_items_df["cart_id"].isin(carts_df["id"])]


#import into azure sql
import pyodbc
from sqlalchemy import create_engine


# azure sql database credentials
server = ""
database = ""
username = ""
password = ""

# create an engine using sqlalchemy
connection_string = f"mssql+pyodbc://{username}:{password}@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server"
engine = create_engine(connection_string)

# function to insert a dataframe into azure sql database
def insert_data(df, table_name):
    try:
        df.to_sql(table_name, con=engine, if_exists="append", index=False, method="multi", chunksize=1000)
        print(f"inserted data into {table_name} successfully!")
    except Exception as e:
        print(f"error inserting into {table_name}: {e}")



# insert into azure sql database
insert_data(users_df, "users")
insert_data(products_df, "products")
insert_data(carts_df, "carts")
insert_data(cart_items_df, "cart_items")

print("Data Insertion Completed!")





