FROM condaforge/mambaforge

## Must add `DEBIAN_FRONTEND=noninteractive` to prevent any os waiting for user input situations
  ## see --> https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai
ARG DEBIAN_FRONTEND=noninteractive

## Update server
RUN apt-get --quiet --yes update
# RUN apt-get -y upgrade
RUN apt-get install -y git zip unzip wget

## Clean up a bit to keep the image small
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN mamba install -c conda-forge -y git nodejs jupyterlab jupyterlab-git jupyter-sysml-kernel

# install pip items if you like 
# RUN pip install --upgrade pip && \
#     pip install --upgrade \
#     jupyterlab \
#     jupyter-git

RUN jupyter lab build

# install ijava kernel
WORKDIR /tmp
RUN wget https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip
RUN unzip ijava-1.3.0.zip
RUN python3 install.py --sys-prefix
RUN rm -rf *

# Install IAlf kenrel (https://github.com/Open-MBEE/IAlf) 
# Note that the alfi.jav is pulled from the `research` branch of the alf-reference-implemtation
## https://github.com/ModelDriven/Alf-Reference-Implementation/tree/research/org.modeldriven.alf.interactive/dist
RUN wget https://github.com/ModelDriven/Alf-Reference-Implementation/raw/research/org.modeldriven.alf.interactive/dist/alfi.jar
RUN wget https://github.com/ModelDriven/Alf-Reference-Implementation/raw/master/dist/alf.zip
RUN unzip alf.zip
RUN git clone https://github.com/Open-MBEE/IAlf.git
WORKDIR /tmp/IAlf
RUN chmod +x gradlew
RUN ./gradlew installKernel --user --param classpath:/tmp/alfi.jar --param alf-library-path:/tmp/alf/Libraries --param alf-model-path:/tmp/alf/Models --scan

# RUN git clone "add a remote folder here..." [Note: better for a set of static files but this shows how to dot it.]
WORKDIR /notebooks
RUN git clone https://github.com/avianinc/example_files.git

# create a local volume if you like
# VOLUME /notebooks
# RUN chmod -R 755 /notebooks/

# Expose the working port and execute command
EXPOSE 8888

CMD ["jupyter", "lab", "--ip=*", "--port=8888", "--no-browser", "--allow-root", "--LabApp.token=''"]
# CMD ["/bin/bash"]