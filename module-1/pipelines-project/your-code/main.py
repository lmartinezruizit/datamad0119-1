import numpy as np
import pandas as pd
import re
import plotly as plotly
import plotly.plotly as py
import plotly.graph_objs as go
from plotly.offline import *
import argparse
from dotenv import load_dotenv
import os
import subprocess

load_dotenv(dotenv_path='.env')
SECRET_KEY = os.getenv("TOKEN")

#Function to obtain data
def read():
    df = pd.read_csv('uio_clean.csv')
    return df

#Function to clean dataframe
def clean(df):
    #Drop column
    df = df.drop("store_and_fwd_flag",axis=1)
    #Casting string to datetime
    df['pickup_datetime'] = pd.to_datetime(df['pickup_datetime'])
    df['dropoff_datetime'] = pd.to_datetime(df['dropoff_datetime'])
    #Obtain de principal vendor
    vendors=sorted(df.vendor_id.unique())
    df=df.drop(df.index[df['vendor_id']!=vendors[0]])
    return df

#Function to start
def acquire():
    # path=
    df=read()
    df=clean(df)
    return df

#Function which creates new columns
def add_estimation_columns(df):
    #Create new column with the day of week
    df['day_of_week'] = df['pickup_datetime'].dt.day_name()
    #Sec. to min.
    df['wait_estimate']=df['wait_sec']/60
    #Create bins and news dfframes
    df["status"] = pd.cut(df["wait_sec"], bins=[df["wait_sec"].min()-1,df['wait_sec'].median()*0.5,df['wait_sec'].median()*1.5,df['wait_sec'].max()+1], labels=["Good","Medium","Bad"])
    df_worse=df[df['status']=='Bad']
    df_middle=df[df['status']=='Medium']
    df_best=df[df['status']=='Good']
    return df_worse,df_middle,df_best
    
#Plot bar chart
def bar_chart(df):
    y_df=[df['status'][df['status']=='Good'].count(),df['status'][df['status']=='Medium'].count(),df['status'][df['status']=='Bad'].count()],
    x_df=['0 - '+str(df['wait_sec'].median()*0.5), str(df['wait_sec'].median()*0.5)+' - '+str(df['wait_sec'].median()*1.5),
        str(df['wait_sec'].median()*1.5)+' - '+str(df['wait_sec'].max())]

    trace0 = go.Bar(
        x=x_df,
        y=y_df[0],
        marker=dict(
            color=['rgba(204,204,204,1)', 'rgba(222,45,38,0.8)',
                'rgba(204,204,204,1)', 'rgba(204,204,204,1)',
                'rgba(204,204,204,1)']),
    )

    data = [trace0]
    layout = go.Layout(
    title='Comparative Wait Time',
    )

    fig = go.Figure(data=data, layout=layout)
    plotly.offline.plot(fig, filename='comparative_wait_time')

#Plot map chart
def map_chart(df):
    mapbox_access_token = 'pk.eyJ1IjoibG1hcnRpbmV6cnVpeml0IiwiYSI6ImNqcnV2NTNycjE3ZnQzeXFzbHk3NXB5MjYifQ.Namsd_wjsdPevALwq2YTmQ'

    site_lat = df.pickup_latitude
    site_lon = df.pickup_longitude
    locations_name = ["df.vendor_id","vendor"]

    df2 = [
        go.Scattermapbox(
            lat=site_lat,
            lon=site_lon,
            mode='markers',
            marker=dict(
                size=17,
                color='rgb(255, 0, 0)',
                opacity=0.7
            ),
            text=locations_name,
            hoverinfo='text'
        ),
        go.Scattermapbox(
            lat=site_lat,
            lon=site_lon,
            mode='markers',
            marker=dict(
                size=8,
                color='rgb(242, 177, 172)',
                opacity=0.7
            ),
            hoverinfo='none'
        )]
            
    layout = go.Layout(
        title='Taxi Routes in Quito',
        autosize=True,
        hovermode='closest',
        showlegend=False,
        mapbox=dict(
            accesstoken=mapbox_access_token,
            bearing=0,
            center=dict(
                lat=38,
                lon=-94
            ),
            pitch=0,
            zoom=3,
            style='light'
        ),
    )
    fig = dict(data=df2, layout=layout)
    plotly.offline.plot(fig, filename='Taxi_Routes_Quito' )

#Plot barmode chart
def barmode_chart(df_worse,df_middle,df_best):
    worse_y=[y for y in df_worse.day_of_week.value_counts()]
    worse_x=[x for x in df_worse.day_of_week.value_counts().index]

    trace1 = {
    'x': worse_x,
    'y': worse_y,
    'name': 'Worse',
    'type': 'bar'
    };
    middle_y=[y for y in df_middle.day_of_week.value_counts()]
    middle_x=[x for x in df_middle.day_of_week.value_counts().index]
    trace2 = {
    'x': middle_x,
    'y': middle_y,
    'name': 'Middle',
    'type': 'bar'
    };
    best_y=[y for y in df_best.day_of_week.value_counts()]
    best_x=[x for x in df_best.day_of_week.value_counts().index]
    trace3 = {
    'x': best_x,
    'y': best_y,
    'name': 'Best',
    'type': 'bar'
    }
    data = [trace1, trace2, trace3];
    layout = {
    'xaxis': {'title': 'Days of week'},
    'yaxis': {'title': 'Wait time'},
    'barmode': 'relative',
    'title': 'Estimate for days of the week'
    };
    plotly.offline.plot({'data': data, 'layout': layout}, filename='Estimate_per_days')

def report(df,df_worse,df_middle,df_best):
    bar_chart(df)
    map_chart(df_worse)
    barmode_chart(df_worse,df_middle,df_best)

def send_mail():
    command_line = 'echo "El reporte consta de tres gráficos, en los cuales podemos ver los puntos en los que más espera por parte del cliente se produce y los días de la semana más solicitados, en este caso el Viernes" | mail --attach="./Taxi_Routes_Quito.html" -s "Pipelines-Project Luis" luishcf9@gmail.com'
    process = subprocess.Popen(command_line, shell=True)
    returncode = process.wait()

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    group = parser.add_mutually_exclusive_group()
    group.add_argument("-q", "--quiet", action="store_true")
    args = parser.parse_args()

    if args.quiet==False:
        df = acquire()
        df_worse,df_middle,df_best=add_estimation_columns(df)
        report(df,df_worse,df_middle,df_best)
        send_mail()