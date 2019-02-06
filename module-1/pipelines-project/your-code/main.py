import dash
import dash_core_components as dcc
import dash_html_components as html
import plotly.graph_objs as go
import pandas as pd

df = pd.read_csv('/home/luis/Documents/IronHack/labs-projects/datamad0119-1/module-1/pipelines-project/your-code/uio_clean.csv')

df = df.drop("store_and_fwd_flag",axis=1)

#Casting string to datetime
df['pickup_datetime'] = pd.to_datetime(df['pickup_datetime'])
df['dropoff_datetime'] = pd.to_datetime(df['dropoff_datetime'])

#Obtain de principal vendor
vendors=sorted(df.vendor_id.unique())
df=df.drop(df.index[df['vendor_id']!='Quito'])


date_options = df["pickup_datetime"].unique()

app = dash.Dash()

app.layout = html.Div([
    html.H2("Taxi Routes"),
    html.Div(
        [
            dcc.Dropdown(
                id="Date",
                options=[{
                    'label': i,
                    'value': i
                } for i in date_options],
                value='All Dates'),
        ],
        style={'width': '25%',
               'display': 'inline-block'}),
    dcc.Graph(id='taxi-routes'),
])


@app.callback(
    dash.dependencies.Output('taxi-routes', 'figure'),
    [dash.dependencies.Input('Date', 'value')])
def update_graph(Date_pick):
    if Date_pick == "All Dates":
        df_plot = df.copy()
    else:
        df_plot = df[df['pickup_datetime'] == Date_pick]

    pv = pd.pivot_table(
        df_plot,
        index=['Name'],
        columns=["Status"],
        values=['Quantity'],
        aggfunc=sum,
        fill_value=0)

    trace1 = go.Bar(x=pv.index, y=pv[('Quantity', 'declined')], name='Declined')
    trace2 = go.Bar(x=pv.index, y=pv[('Quantity', 'pending')], name='Pending')
    trace3 = go.Bar(x=pv.index, y=pv[('Quantity', 'presented')], name='Presented')
    trace4 = go.Bar(x=pv.index, y=pv[('Quantity', 'won')], name='Won')

    return {
        'data': [trace1, trace2, trace3, trace4],
        'layout':
        go.Layout(
            title='Customer Order Status for {}'.format(Date_pick),
            barmode='stack')
    }


if __name__ == '__main__':
    app.run_server(debug=True)