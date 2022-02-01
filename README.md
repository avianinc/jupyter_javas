# jupyter_javas
Jupyter lab java build including IAlf and iJava

## Usage

1.  Install Docker Desktop --> https://www.docker.com/products/docker-desktop

### Files

#### Github files - Use git hub files instead of a local volume to make life easier. Jupyter-git is installed.
##### Jupyter-git: You must use a PAT (personal access token) to push files to your repo.
##### https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token 

### Command Line 
-Build: docker build -t jl_ijava .  # dont for get the `.` after jl_java
-Run: docker run -p 8888:8888 -it jl_ijava jl_java
