FROM nvcr.io/nvidia/deepstream-l4t:5.1-21.02-samples

RUN apt-get update && apt-get install -y \
  autoconf \ 
  automake \
  libtool \
  python3-dev \
  libpython3-dev \
  libgstreamer1.0-dev

WORKDIR /opt/nvidia/deepstream/deepstream-5.1/sources

RUN git clone https://github.com/NVIDIA-AI-IOT/deepstream_python_apps.git

# install gst-python

RUN apt-get install python-gi-dev -y
RUN export GST_LIBS="-lgstreamer-1.0 -lgobject-2.0 -lglib-2.0"
RUN export GST_CFLAGS="-pthread -I/usr/include/gstreamer-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include"
RUN git clone https://github.com/GStreamer/gst-python.git

WORKDIR /opt/nvidia/deepstream/deepstream-5.1/sources/gst-python

RUN git checkout 1a8f48a
RUN ./autogen.sh PYTHON=python3; exit 0
#not sure why, but running it twice makes it work
RUN ./autogen.sh PYTHON=python3
RUN ./configure PYTHON=python3
RUN make
RUN make install

CMD ["bash"]
