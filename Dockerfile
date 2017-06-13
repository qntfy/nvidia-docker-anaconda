FROM nvidia/cuda:8.0-cudnn5-runtime

# Add some dependencies
RUN apt-get clean && apt-get update -y -qq
RUN apt-get install -y curl git build-essential

ENV LATEST_CONDA "4.4.0"
ENV PATH="/root/anaconda2/bin:${PATH}"

RUN curl --silent -O https://repo.continuum.io/archive/Anaconda2-$LATEST_CONDA-Linux-x86_64.sh \
    && bash Anaconda2-$LATEST_CONDA-Linux-x86_64.sh -b -p /root/anaconda2

RUN pip install keras && conda install pygpu
RUN /bin/bash
