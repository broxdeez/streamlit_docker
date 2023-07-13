import streamlit as st
import requests
import pandas as pd

st.title('Streamlit Demo')

st.divider()

url = 'https://dummyjson.com/products'
response = requests.get(url)
data = response.json()
# limit to 2 products in data
data = pd.DataFrame(data['products'][:10])
st.write(data[['id', 'title', 'price','description']])



