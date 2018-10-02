
FROM python:2
MAINTAINER Charalampos Chomenidis <hampos@me.com>

RUN pip install --upgrade pip
RUN pip install numpy
RUN apt-get update
RUN apt-get install -y libatlas-base-dev gfortran libopenblas-dev
RUN pip install scipy
RUN pip install 'scikit-learn==0.19.2'

RUN apt-get install -y apache2-dev
RUN pip install mod_wsgi
RUN pip install flask

# Expose the ports we're interested in
EXPOSE 5000

ADD ./pyson_production.py /pyson_production.py


CMD ["python","/pyson_production.py"]
