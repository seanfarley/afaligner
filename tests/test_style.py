import os
import pycodestyle


def test_pycodestyle():
    style = pycodestyle.StyleGuide(quiet=False)
    path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
    errors = style.check_files([path])
    assert errors.total_errors == 0, (
        f"{errors.total_errors} code style errors found"
    )
