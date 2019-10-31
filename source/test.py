import os
import pandas as pd

os.getcwd()


def test_if_df(data: pd.DataFrame) -> bool:
    """Test if passed data instance is from class DataFrame

    Arguments:
        data {pd.DataFrame} -- This is data input
    Returns:
        bool -- Returns bool if passed data is data
    """

    return isinstance(df, pd.DataFrame)


df = pd.DataFrame([1, 2, 3], columns=["col1"]).assign(
    long="looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong"
)

assert test_if_df(df)
