FROM pandoc/extra:3.6.4.0-ubuntu

RUN apt-get update && apt-get install default-jre graphviz plantuml -y && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY --chmod=755 plantuml.py /filters/plantuml.py


