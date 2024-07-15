# Fyle Backend Challenge

## Output Images 

<img src="./assets/op4.png" alt="output image"/>
<br>
<img src="./assets/op1.png" alt="output image"/>
<br>
<img src="./assets/op2.png" alt="output image"/>
<br>
<img src="./assets/op3.png" alt="output image"/>
<br>


## Installation

1. Fork this repository to your github account
2. Clone the forked repository and proceed with steps mentioned below

### Install requirements

```
virtualenv env --python=python3.8
source env/bin/activate
pip install -r requirements.txt
```
### Reset DB

```
export FLASK_APP=core/server.py
rm core/store.sqlite3
flask db upgrade -d core/migrations/
```
### Start Server

```
bash run.sh
```
### Run Tests

```
pytest -vvv -s tests/

# for test coverage report
# pytest --cov
# open htmlcov/index.html
```
