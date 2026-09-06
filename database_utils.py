import pandas as pd
from sqlalchemy import create_engine


def create_connection(database="car_database.db"):
    return create_engine(f"sqlite:///{database}")


def run_query(query, database="car_database.db"):
    engine = create_connection(database)
    return pd.read_sql(query, engine)


def load_csv_to_database(
    csv_file,
    table_name="cars",
    database="car_database.db"
):
    df = pd.read_csv(csv_file)

    engine = create_connection(database)

    df.to_sql(
        table_name,
        engine,
        if_exists="replace",
        index=False
    )

    return f"{len(df)} rows loaded successfully."