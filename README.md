# jupyter_javas ![Docker Publish](https://github.com/avianinc/jupyter_javas/actions/workflows/publish.yml/badge.svg?event=push)
Jupyter lab java build including IAlf, iJava, and the Jupyter SysMLv2 kernel for testing purposes.

Docker Image: `avianinc\jupyter_javas:main`
- *Note: the image shows failed sometimes but it looks like it relative to a bandwidth limitation on gradle files. After a couple of hours it starts working again with no coe changes.*

## Usage

1. Install Docker Desktop --> https://www.docker.com/products/docker-desktop (Requires admin privileges)
2. From the command line pull the docker file --> `docker pull avianinc/jupyter_javas:main` (get a beer... it takes a bit)
    ![Pull the Container](./images/power_shell_pull2.png "Pull the Container")

3. In docker desktop select the image and press 'Run`. 

    ![Run Container](./images/docker_run.png "Run the Container")

4. Name the container (optional) and set the port to `8888` then press `Run`.

    ![Container Settings](./images/optional_settings.png "Container Settings")

5. `Containers/Apps` will pop up showing the container icon green for the new container

    ![Containers](./images/containters.png "Containers")

6. Select the running container and press the `Open In Browser` icon

    ![Open In Browser](./images/open_in_browser.png "Open In Browser")

7. Jupyter lab will open... Ensure that the latest example files are pulled in jupyter lab

    ![git pull](./images/git_pull.png "git pull")

    - Press the git icon on the left toolbar... ![git icon](./images/git_icon.png "git icon")

    - Drill down into the `example_files` folder

    - Press the down arrow to pull the latest files... ![git pull icon](./images/git_pull_icon.png "git pull icon")

---
### Docker File
The `Dockerfile` builds the image and when modified and pushed to github a workflow will kick off to republish the docker container to docker hub as `avianinc\jupyter_javas:main`

#### *Github files* - Use git hub files instead of a local volume to make life easier. Jupyter-git is installed.
#### *Jupyter-git* -  You must use a PAT (personal access token) to push files to your repo.
    - https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token 

### Docker Command Line
1. git pull https://github.com/avianinc/jupyter_javas.git
2. cd jupyter_javas
3. Build: `docker build -t jl_ijava .`  # dont for get the `.` after jl_java
4. Run: `docker run -p 8888:8888 -it jl_ijava jl_java`
5. browse: http://localhost:8888
