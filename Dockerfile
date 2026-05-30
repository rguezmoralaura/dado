FROM python:3.12
RUN useradd user
RUN pip install dice
WORKDIR /app/
COPY main.py /app/
USER user
CMD ["python","/app/main.py"]