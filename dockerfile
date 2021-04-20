  # The base image we want to inherit from

  FROM python:3
  ENV PYTHONUNBUFFERED 1

  RUN mkdir /tutorial
  WORKDIR /tutorial

  # using ADD with the requirements (vs copy) makes use of caching to speed up consecutive builds
  ADD requirements.txt ./

  # Install the pip requirements file depending on 
  # the uncommitted .env file passed in when starting build.
  RUN pip install --no-cache-dir -Ur requirements.txt

  # Copy the rest of our application.
  COPY . .

  # Expose the application on port 8000 (check if container run or compose needs to map to 8000 locally)
  EXPOSE 8000
  # Run test server
  # CMD ["python", "manage.py", "runserver"]
