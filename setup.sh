set -ex

### Install Runtime libraries

yum -y install python-pip git
pip install --upgrade pip
pip install virtualenv

# Clone our app from git
cd /var
git clone https://github.com/AvijitChowdhury/StudentMarkPrediction
cd /var/StudentMarkPrediction

### Create a Virtual Environment for our App
virtualenv /var/StudentMarkPrediction
source /var/StudentMarkPrediction/bin/activate

### Install the App dependencies
pip install -r requirements.txt
pip install gunicorn

# Start `gunicorn`
# Start the `gunicorn` and bind it port `8000` and listen on all interfaces
gunicorn --bind 0.0.0.0:8000 appsrc:application &

# Deactivate
deactivate