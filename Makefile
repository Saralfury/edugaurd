.PHONY: up stop train test env

up:
	docker-compose up --build

stop:
	docker-compose down

train:
	set PYTHONPATH=. && py -3 scripts/generate_data.py && py -3 src/app/models/train.py

api:
	set PYTHONPATH=. && py -3 -m uvicorn src.app.main:app --host 0.0.0.0 --port 8000 --reload

dashboard:
	set PYTHONPATH=. && py -3 -m streamlit run src/app/dashboard/streamlit_app.py --server.port 8501

test:
	set PYTHONPATH=. && py -3 -m pytest src/app/tests/

env:
	py -3 -m pip install --prefer-binary -r requirements.txt
